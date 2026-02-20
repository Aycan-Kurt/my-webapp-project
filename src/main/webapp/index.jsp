<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Ders Syllabus</title>
    <style>
        :root{
            --bg:#f5f7fb;
            --card:#ffffff;
            --muted:#6b7280;
            --accent:#2563eb;
            --glass: rgba(255,255,255,0.6);
            --shadow: 0 6px 18px rgba(20,24,40,0.08);
            --radius:12px;
            --max-width:1100px;
        }
        *{box-sizing:border-box}
        body{
            margin:0;font-family:Inter,ui-sans-serif,system-ui,-apple-system,Segoe UI,Roboto,Helvetica,Arial;
            background:linear-gradient(180deg,var(--bg),#eef2f7);color:#0f172a;-webkit-font-smoothing:antialiased;
            -moz-osx-font-smoothing:grayscale;
        }
        .wrap{max-width:var(--max-width);margin:36px auto;padding:24px}
        header{display:flex;align-items:center;justify-content:space-between;gap:16px}
        .title{display:flex;flex-direction:column}
        .title h1{margin:0;font-size:20px;letter-spacing:-0.2px}
        .title p{margin:2px 0 0;color:var(--muted);font-size:13px}

        .controls{display:flex;gap:8px;align-items:center}
        .btn{background:var(--card);border:1px solid #e6eef9;padding:8px 12px;border-radius:10px;cursor:pointer;box-shadow:var(--shadow);font-size:13px}
        .btn.primary{background:var(--accent);color:#fff;border:none}
        .toggle{display:inline-flex;gap:6px}

        main{margin-top:18px}
        .grid{display:grid;grid-template-columns:repeat(3,1fr);gap:16px}
        .card{background:var(--card);padding:18px;border-radius:var(--radius);box-shadow:var(--shadow);border:1px solid rgba(15,23,42,0.04)}
        .card h3{margin:0 0 8px;font-size:16px}
        .meta{color:var(--muted);font-size:13px;margin-bottom:12px}
        .card p{margin:0;color:#0f172a;font-size:14px;line-height:1.4}

        /* responsive */
        @media (max-width:1000px){.grid{grid-template-columns:repeat(2,1fr)}}
        @media (max-width:640px){.grid{grid-template-columns:1fr}.wrap{padding:12px}}

        /* table view */
        .table{width:100%;border-collapse:collapse;background:transparent}
        .table th,.table td{padding:12px 10px;border-bottom:1px solid #eef2f6;text-align:left}
        .table th{background:transparent;color:var(--muted);font-weight:600;font-size:13px}

        .view-hidden{display:none}

        .toolbar{display:flex;gap:8px;align-items:center}

        /* small helper */
        .muted{color:var(--muted);font-size:13px}

        /* search */
        .search{padding:8px 12px;border-radius:10px;border:1px solid #e6eef9;background:var(--card)}
    </style>
</head>
<body>
    <div class="wrap">
        <header>
            <div class="title">
                <h1>Ders Syllabus - (Buraya ders adı gelecek)</h1>
                <p class="muted">Kısa açıklama veya dönem bilgisi: [Dönem, Yıl]</p>
            </div>

            <div class="controls">
                <div class="toolbar">
                    <input id="search" class="search" placeholder="Syllabus içinde ara..." oninput="filterCards()" />
                </div>
                <div class="toggle" role="tablist" aria-label="Görünüm seçenekleri">
                    <button class="btn" onclick="showView('cards')" aria-pressed="true">Kart Görünümü</button>
                    <button class="btn" onclick="showView('table')">Tablo Görünümü</button>
                </div>
            </div>
        </header>

        <main>
            <!-- KART GÖRÜNÜMÜ - Kullanıcı syllabus metnini buradaki kartlara yapıştırabilir -->
            <section id="cardsView" class="cards">
                <div class="grid" id="cardsGrid">
                    <!-- Örnek kart. PDF içeriğinizdeki bölümleri burada çoğaltacağım. -->
                    <article class="card" data-search="genel bakis instructor hedefler">
                        <h3>Genel Bakış</h3>
                        <div class="meta">Ders Kodu: [KOD] • Kredi: [3]</div>
                        <p>Bu alana dersin kısa açıklamasını yapıştırın. Örn: Bu ders, web geliştirme temellerini ve modern uygulama tasarımını öğretir.</p>
                    </article>

                    <article class="card" data-search="öğretim üyesi iletişim saatler">
                        <h3>Öğretim Üyesi & İletişim</h3>
                        <div class="meta">İsim: [Ad Soyad] • Ofis Saati: [Saatler]</div>
                        <p>Email: instructor@example.edu • Ofis: Bina X, Oda Y</p>
                    </article>

                    <article class="card" data-search="program ve haftalik konu">
                        <h3>Haftalık Program</h3>
                        <div class="meta">Toplam Hafta: 14</div>
                        <p>Hafta 1: Giriş · Hafta 2: HTML & CSS · Hafta 3: Responsive Tasarım · ...</p>
                    </article>

                    <article class="card" data-search="değerlendirme sınav ödev katılım">
                        <h3>Değerlendirme</h3>
                        <div class="meta">Sınavlar • Ödevler • Proje</div>
                        <p>Puan dağılımı: Ara Sınav %30, Final %40, Ödevler %20, Katılım %10</p>
                    </article>

                    <article class="card" data-search="kaynak kitap materyal önerilen kaynaklar">
                        <h3>Kaynaklar</h3>
                        <div class="meta">Zorunlu & Önerilen</div>
                        <p>1) Kitap A • 2) Makale B • 3) Online materyaller (linkler PDF içine yapıştırılabilir)</p>
                    </article>

                    <article class="card" data-search="politikalar intihal gecikme teslim">
                        <h3>Politikalar</h3>
                        <div class="meta">Geç teslim, intihal, erişilebilirlik</div>
                        <p>Geç teslim politikası ve akademik dürüstlük kuralları burada yer alır.</p>
                    </article>
                </div>
            </section>

            <!-- TABLO GÖRÜNÜMÜ - PDF içeriğini tabloya uygun şekilde yerleştirebilirsiniz -->
            <section id="tableView" class="view-hidden">
                <table class="table" id="syllabusTable">
                    <thead>
                        <tr>
                            <th>Bölüm</th>
                            <th>Açıklama</th>
                            <th>Detaylar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Genel Bakış</td>
                            <td>Dersin kısa tanımı ve hedefleri.</td>
                            <td>Kredit, Önkoşullar</td>
                        </tr>
                        <tr>
                            <td>Öğretim Üyesi</td>
                            <td>İsim, iletişim bilgileri, ofis saatleri</td>
                            <td>Email, Ofis</td>
                        </tr>
                        <tr>
                            <td>Değerlendirme</td>
                            <td>Puan dağılımı ve teslim tarihleri</td>
                            <td>Yüzdeler, sınav tarihleri</td>
                        </tr>
                    </tbody>
                </table>
            </section>
        </main>

        <!-- Not: PDF'inizden alacağınız tam metinleri yukarıdaki kartlar veya tablo satırları içine yapıştırın. Eğer PDF'i çalışma alanına taşırsanız, içeriği doğrudan buraya otomatik ekleyebilirim. -->
    </div>

    <script>
        function showView(view){
            const cards = document.getElementById('cardsView');
            const table = document.getElementById('tableView');
            if(view==='table'){
                cards.classList.add('view-hidden');
                table.classList.remove('view-hidden');
            } else {
                table.classList.add('view-hidden');
                cards.classList.remove('view-hidden');
            }
        }

        function filterCards(){
            const q = document.getElementById('search').value.trim().toLowerCase();
            const cards = document.querySelectorAll('#cardsGrid .card');
            cards.forEach(c=>{
                const text = (c.getAttribute('data-search')||'') + ' ' + c.innerText;
                if(!q || text.toLowerCase().includes(q)) c.style.display='block'; else c.style.display='none';
            });
        }
    </script>
</body>
</html>
