<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Java Assessment Portal</title>
    <style>
        :root {
            --bg: #f8fafc;
            --surface: #ffffff;
            --primary: #2563eb;
            --primary-hover: #1d4ed8;
            --text-main: #0f172a;
            --text-muted: #64748b;
            --border: #e2e8f0;
            --border-hover: #cbd5e1;
            --accent: #eff6ff;
        }
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif; background-color: var(--bg); color: var(--text-main); line-height: 1.5; padding-bottom: 5rem; }
        
        .header { background: var(--surface); border-bottom: 1px solid var(--border); padding: 1.25rem 2rem; position: sticky; top: 0; z-index: 50; display: flex; justify-content: space-between; align-items: center; box-shadow: 0 1px 3px rgba(0,0,0,0.05); }
        .header h1 { font-size: 1.25rem; font-weight: 700; color: var(--text-main); }
        .badge { background: var(--accent); color: var(--primary); padding: 0.35rem 0.8rem; border-radius: 9999px; font-weight: 600; font-size: 0.85rem; }

        .container { max-width: 850px; margin: 2rem auto; padding: 0 1rem; }
        
        .card { background: var(--surface); border: 1px solid var(--border); border-radius: 12px; padding: 1.5rem; margin-bottom: 1.5rem; box-shadow: 0 1px 3px rgba(0,0,0,0.03); transition: border-color 0.2s; }
        .card:hover { border-color: var(--border-hover); }
        
        .q-header { display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 1rem; }
        .q-num { font-size: 0.85rem; font-weight: 700; color: var(--text-muted); text-transform: uppercase; letter-spacing: 0.05em; }
        .btn-clear { background: none; border: none; color: var(--text-muted); font-size: 0.8rem; cursor: pointer; text-decoration: underline; }
        .btn-clear:hover { color: #dc2626; }
        
        .q-title { font-size: 1.1rem; font-weight: 600; color: var(--text-main); margin-bottom: 1.25rem; }
        
        .options-list { display: flex; flex-direction: column; gap: 0.6rem; }
        .option-item { display: flex; align-items: center; padding: 0.85rem 1rem; border: 1.5px solid var(--border); border-radius: 8px; cursor: pointer; transition: all 0.15s ease-in-out; }
        .option-item:hover { background-color: var(--accent); border-color: #93c5fd; }
        .option-item input[type="radio"] { margin-right: 0.9rem; width: 1.15rem; height: 1.15rem; accent-color: var(--primary); cursor: pointer; }
        .option-text { font-size: 0.95rem; }
        
        .footer-action { position: fixed; bottom: 0; left: 0; right: 0; background: var(--surface); border-top: 1px solid var(--border); padding: 1rem 2rem; display: flex; justify-content: center; box-shadow: 0 -4px 6px -1px rgba(0,0,0,0.05); }
        .btn-submit { background-color: var(--primary); color: #fff; border: none; padding: 0.85rem 2.5rem; font-size: 1rem; font-weight: 600; border-radius: 8px; cursor: pointer; transition: background 0.15s; }
        .btn-submit:hover { background-color: var(--primary-hover); }
    </style>
</head>
<body>

<header class="header">
    <h1>Java Packages Assessment</h1>
    <span class="badge">${questions.size()} Questions</span>
</header>

<div class="container">
    <form id="quizForm" action="submit-quiz" method="post">
        <c:forEach var="q" items="${questions}" varStatus="status">
            <div class="card" id="card_${q.id}">
                <div class="q-header">
                    <span class="q-num">Question ${status.count} of ${questions.size()}</span>
                    <button type="button" class="btn-clear" onclick="clearOption('q_${q.id}')">Clear Answer</button>
                </div>
                <div class="q-title">${q.questionText}</div>
                
                <div class="options-list">
                    <label class="option-item">
                        <input type="radio" name="q_${q.id}" value="A">
                        <span class="option-text"><strong>A.</strong> ${q.optionA}</span>
                    </label>
                    <label class="option-item">
                        <input type="radio" name="q_${q.id}" value="B">
                        <span class="option-text"><strong>B.</strong> ${q.optionB}</span>
                    </label>
                    <label class="option-item">
                        <input type="radio" name="q_${q.id}" value="C">
                        <span class="option-text"><strong>C.</strong> ${q.optionC}</span>
                    </label>
                    <label class="option-item">
                        <input type="radio" name="q_${q.id}" value="D">
                        <span class="option-text"><strong>D.</strong> ${q.optionD}</span>
                    </label>
                </div>
            </div>
        </c:forEach>

        <div class="footer-action">
            <button type="submit" class="btn-submit">Submit Assessment</button>
        </div>
    </form>
</div>

<script>
    function clearOption(name) {
        const radios = document.getElementsByName(name);
        for (let i = 0; i < radios.length; i++) {
            radios[i].checked = false;
        }
    }
</script>

</body>
</html>