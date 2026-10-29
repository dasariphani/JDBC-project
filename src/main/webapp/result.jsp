<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Assessment Analytics & Report</title>
    <style>
        :root {
            --bg: #f8fafc;
            --surface: #ffffff;
            --text-main: #0f172a;
            --text-muted: #64748b;
            --border: #e2e8f0;
            --correct-bg: #ecfdf5;
            --correct-text: #059669;
            --correct-border: #a7f3d0;
            --wrong-bg: #fef2f2;
            --wrong-text: #dc2626;
            --wrong-border: #fecaca;
            --skip-bg: #fffbeb;
            --skip-text: #d97706;
            --skip-border: #fde68a;
        }
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif; background-color: var(--bg); color: var(--text-main); line-height: 1.5; padding: 2rem 1rem; }
        .container { max-width: 900px; margin: 0 auto; }
        
        /* Summary Card */
        .summary-card { background: var(--surface); border-radius: 14px; border: 1px solid var(--border); padding: 2rem; box-shadow: 0 4px 6px -1px rgba(0,0,0,0.05); margin-bottom: 2rem; }
        .summary-header { display: flex; justify-content: space-between; align-items: center; border-bottom: 1px solid var(--border); padding-bottom: 1.5rem; margin-bottom: 1.5rem; }
        .score-headline { font-size: 2.2rem; font-weight: 800; color: var(--text-main); }
        .status-badge { padding: 0.5rem 1.2rem; border-radius: 9999px; font-weight: 700; font-size: 0.95rem; text-transform: uppercase; letter-spacing: 0.05em; }
        .status-passed { background: var(--correct-bg); color: var(--correct-text); border: 1px solid var(--correct-border); }
        .status-failed { background: var(--wrong-bg); color: var(--wrong-text); border: 1px solid var(--wrong-border); }

        /* Metric Grid */
        .metric-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(130px, 1fr)); gap: 1rem; margin-bottom: 1.5rem; }
        .metric-box { background: var(--bg); padding: 1rem; border-radius: 10px; border: 1px solid var(--border); text-align: center; }
        .metric-val { font-size: 1.5rem; font-weight: 700; margin-bottom: 0.2rem; }
        .metric-lbl { font-size: 0.8rem; color: var(--text-muted); font-weight: 600; text-transform: uppercase; }

        .btn-restart { display: inline-block; background: #2563eb; color: #fff; text-decoration: none; padding: 0.75rem 1.75rem; border-radius: 8px; font-weight: 600; font-size: 0.95rem; transition: background 0.15s; }
        .btn-restart:hover { background: #1d4ed8; }

        /* Review Section */
        .section-title { font-size: 1.3rem; font-weight: 700; margin-bottom: 1.25rem; display: flex; justify-content: space-between; align-items: center; }
        .review-card { background: var(--surface); border-radius: 10px; border: 1px solid var(--border); padding: 1.25rem; margin-bottom: 1rem; }
        .review-card.correct { border-left: 5px solid var(--correct-text); }
        .review-card.incorrect { border-left: 5px solid var(--wrong-text); }
        .review-card.skipped { border-left: 5px solid var(--skip-text); }
        
        .review-meta { display: flex; justify-content: space-between; align-items: center; margin-bottom: 0.75rem; }
        .badge-tag { font-size: 0.75rem; font-weight: 700; padding: 0.25rem 0.6rem; border-radius: 6px; text-transform: uppercase; }
        .tag-correct { background: var(--correct-bg); color: var(--correct-text); }
        .tag-incorrect { background: var(--wrong-bg); color: var(--wrong-text); }
        .tag-skipped { background: var(--skip-bg); color: var(--skip-text); }

        .review-q { font-weight: 600; font-size: 1rem; margin-bottom: 0.75rem; color: var(--text-main); }
        .answers-grid { font-size: 0.9rem; display: grid; gap: 0.35rem; }
        .ans-row { display: flex; align-items: center; gap: 0.5rem; }
        .ans-lbl { font-weight: 600; min-width: 120px; color: var(--text-muted); }
    </style>
</head>
<body>

<div class="container">
    <!-- Overview Card -->
    <div class="summary-card">
        <div class="summary-header">
            <div>
                <p style="color: var(--text-muted); font-size: 0.9rem; font-weight: 600;">Overall Result</p>
                <div class="score-headline">${score} / ${total} <span style="font-size: 1.2rem; color: var(--text-muted); font-weight: 500;">(${percentage}%)</span></div>
            </div>
            <c:choose>
                <c:when test="${passed}">
                    <span class="status-badge status-passed">Passed</span>
                </c:when>
                <c:otherwise>
                    <span class="status-badge status-failed">Needs Review</span>
                </c:otherwise>
            </c:choose>
        </div>

        <div class="metric-grid">
            <div class="metric-box">
                <div class="metric-val" style="color: #2563eb;">${attemptedCount}</div>
                <div class="metric-lbl">Attempted</div>
            </div>
            <div class="metric-box">
                <div class="metric-val" style="color: var(--correct-text);">${score}</div>
                <div class="metric-lbl">Correct</div>
            </div>
            <div class="metric-box">
                <div class="metric-val" style="color: var(--wrong-text);">${incorrectCount}</div>
                <div class="metric-lbl">Incorrect</div>
            </div>
            <div class="metric-box">
                <div class="metric-val" style="color: var(--skip-text);">${skippedCount}</div>
                <div class="metric-lbl">Unanswered</div>
            </div>
        </div>

        <a href="quiz" class="btn-restart">Retake Assessment</a>
    </div>

    <!-- Review Section -->
    <div class="section-title">
        <span>Detailed Question Review</span>
    </div>

    <c:forEach var="rev" items="${reviews}" varStatus="status">
        <div class="review-card ${rev.isCorrect ? 'correct' : (rev.isSkipped ? 'skipped' : 'incorrect')}">
            <div class="review-meta">
                <span style="font-size: 0.85rem; font-weight: 600; color: var(--text-muted);">Question ${status.count}</span>
                <c:choose>
                    <c:when test="${rev.isCorrect}">
                        <span class="badge-tag tag-correct">Correct</span>
                    </c:when>
                    <c:when test="${rev.isSkipped}">
                        <span class="badge-tag tag-skipped">Unanswered</span>
                    </c:when>
                    <c:otherwise>
                        <span class="badge-tag tag-incorrect">Incorrect</span>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="review-q">${rev.question.questionText}</div>
            
            <div class="answers-grid">
                <div class="ans-row">
                    <span class="ans-lbl">Your Answer:</span>
                    <span style="${rev.isCorrect ? 'color: var(--correct-text); font-weight: 600;' : (rev.isSkipped ? 'color: var(--skip-text);' : 'color: var(--wrong-text); font-weight: 600;')}">
                        <c:out value="${rev.selectedOption != null ? rev.selectedOption : '-'}" />. ${rev.selectedOptionText}
                    </span>
                </div>
                <c:if test="${!rev.isCorrect}">
                    <div class="ans-row">
                        <span class="ans-lbl">Correct Answer:</span>
                        <span style="color: var(--correct-text); font-weight: 600;">
                            ${rev.question.correctOption}. ${rev.correctOptionText}
                        </span>
                    </div>
                </c:if>
            </div>
        </div>
    </c:forEach>
</div>

</body>
</html>