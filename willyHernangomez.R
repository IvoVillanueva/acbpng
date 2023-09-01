# 📚 Librerias --------------------------------------------------------------


library(tidyverse) # la madre del corder0
library(rvest) # para extraer datos de la web
library(janitor) # limpiar encabezados
library(cropcircles) # fotos en circulo
library(gt) # tabla
library(gtExtras)



# 🔗 Enlaces -----------------------------------------------------------------


cabecera <- "https://raw.githubusercontent.com/IvoVillanueva/nbapng/main/Captura%20de%20pantalla%202023-08-21%20a%20las%200.33.51.png"
nba1 <- "https://www.basketball-reference.com/players/h/hernawi01.html#per_game"
nba2 <- "https://www.basketball-reference.com/players/h/hernawi01.html#per_poss"
nba3 <- "https://www.basketball-reference.com/players/h/hernawi01.html#advanced"
pro1 <- "https://www.proballers.com/es/baloncesto/jugador/12194/willy-hernangomez/totales"
pro2 <- "https://www.proballers.com/es/baloncesto/jugador/12194/willy-hernangomez/totales"
acb1 <- "https://basketball.realgm.com/player/Willy-Hernangomez/Summary/37870#International#table#table-1383"
acb2 <- "https://basketball.realgm.com/player/Willy-Hernangomez/Summary/37870#National"



#  ✍️ Tabla para fotos, colores y logos de fondo -------------------------------------

# ejemplo
# circle_crop(
#   "/Users/ivo/Desktop/Fondo de “Captura de pantalla 2023-08-22 a las 11.55” eliminado.08.png",
#   to  = "lions-bg.png",
#   border_size = 4,
#   border_colour = "#e6b72d"
# )

# mucho rato en esta tabla buscando logos fotos y colores, web.archive.org y remove bg para quitar el fondo a los jpg han sido fundamentales

fotis <- tribble(
  ~tm, ~headshots, ~logo, ~color,
  "RMB", "/Users/ivo/Downloads/RMB.png", "https://static.acb.com/img/www/clubes2023/RealMadridLogo202223.png", "#FEBE10",
  "RMB1", "/Users/ivo/Downloads/JSFPLACB60-removebg-preview.png", "https://static.acb.com/img/www/clubes2023/RealMadridLogo202223.png", "#FEBE10",
  "CAJ", "/Users/ivo/Downloads/CAJ.png", "https://d1yjjnpx0p53s8.cloudfront.net/styles/logo-thumbnail/s3/032011/baloncesto_cajasol-converted.png?itok=wMhq6oi9", "#1b88ad",
  "BSE", "/Users/ivo/Downloads/BSE.png", "https://jotabenza.com/wp-content/uploads/2017/11/CD-Baloncesto-Sevilla-Hotartworks-Hota-Abenza-AJUSTE-Logo-isolated.png", "#0e6547",
  "NOP", "https://web.archive.org/web/20210816223311im_/https://ak-static.cms.nba.com/wp-content/uploads/headshots/nba/latest/260x190/1626195.png", "https://raw.githubusercontent.com/IvoVillanueva/nbapng/main/sin_fondo_NOP.png", "#0f1840",
  "NOP1", "https://web.archive.org/web/20220820151128/https://cdn.nba.com/headshots/nba/latest/1040x760/1626195.png?imwidth=1040&imheight=760", "https://raw.githubusercontent.com/IvoVillanueva/nbapng/main/sin_fondo_NOP.png", "#0f1840",
  "NOP2", "https://web.archive.org/web/20230228143319/https://cdn.nba.com/headshots/nba/latest/1040x760/1626195.png?imwidth=1040&imheight=760", "https://raw.githubusercontent.com/IvoVillanueva/nbapng/main/sin_fondo_NOP.png", "#0f1840",
  "NYK", "https://web.archive.org/web/20170322173943im_/https://ak-static.cms.nba.com/wp-content/uploads/headshots/nba/latest/260x190/1626195.png", "https://raw.githubusercontent.com/IvoVillanueva/nbapng/main/sin_fondo_NYK.png", "#006bb6",
  "NYK1", "https://web.archive.org/web/20180128120108im_/https://ak-static.cms.nba.com/wp-content/uploads/headshots/nba/latest/260x190/1626195.png", "https://raw.githubusercontent.com/IvoVillanueva/nbapng/main/sin_fondo_NYK.png", "#006bb6",
  "CHO", "https://web.archive.org/web/20180225144919im_/https://ak-static.cms.nba.com/wp-content/uploads/headshots/nba/latest/260x190/1626195.png", "https://raw.githubusercontent.com/IvoVillanueva/nbapng/main/sin_fondo_CHA.png", "#00788c",
  "CHO1", "https://web.archive.org/web/20190402175327im_/https://ak-static.cms.nba.com/wp-content/uploads/headshots/nba/latest/260x190/1626195.png", "https://raw.githubusercontent.com/IvoVillanueva/nbapng/main/sin_fondo_CHA.png", "#00788c",
  "CHO2", "https://web.archive.org/web/20200416184446im_/https://ak-static.cms.nba.com/wp-content/uploads/headshots/nba/latest/260x190/1626195.png", "https://raw.githubusercontent.com/IvoVillanueva/nbapng/main/sin_fondo_CHA.png", "#00788c",
  "SPA", "/Users/ivo/Downloads/JSFPSCOPA13-removebg-preview copia.png", "https://raw.githubusercontent.com/IvoVillanueva/nbapng/main/16761048-la-bandera-espan%CC%83ola-en-la-forma-de-un-icono-brillante-removebg-preview.png", "#ad1519",
  "SPA1", "/Users/ivo/Downloads/JSFPLACB58-removebg-preview copia.png", "https://raw.githubusercontent.com/IvoVillanueva/nbapng/main/16761048-la-bandera-espan%CC%83ola-en-la-forma-de-un-icono-brillante-removebg-preview.png", "#ad1519",
  "SPA2", "/Users/ivo/Downloads/JSFPLACB59-removebg-preview copia.png", "https://raw.githubusercontent.com/IvoVillanueva/nbapng/main/16761048-la-bandera-espan%CC%83ola-en-la-forma-de-un-icono-brillante-removebg-preview.png", "#ad1519",
  "SPA3", "/Users/ivo/Downloads/Captura_de_pantalla_2023-08-27_a_las_14.01.42-removebg-preview.png", "https://raw.githubusercontent.com/IvoVillanueva/nbapng/main/16761048-la-bandera-espan%CC%83ola-en-la-forma-de-un-icono-brillante-removebg-preview.png", "#ad1519",
  "SPA4", "/Users/ivo/Downloads/Captura_de_pantalla_2023-08-27_a_las_13.47.22-removebg-preview.png", "https://raw.githubusercontent.com/IvoVillanueva/nbapng/main/16761048-la-bandera-espan%CC%83ola-en-la-forma-de-un-icono-brillante-removebg-preview.png", "#ad1519",
  "SPA5", "/Users/ivo/Downloads/Captura_de_pantalla_2023-08-27_a_las_13.42.13-removebg-preview.png", "https://raw.githubusercontent.com/IvoVillanueva/nbapng/main/16761048-la-bandera-espan%CC%83ola-en-la-forma-de-un-icono-brillante-removebg-preview.png", "#ad1519",
  "SPA6", "/Users/ivo/Downloads/image-removebg-preview.png", "https://www.fiba.basketball/api/img/team/logoflag/0?sizeType=Big&backgroundType=Light&patternType=default_big&eventId=9472&iocCode=ESP", "#ad1519",
  "SPA7", "/Users/ivo/Downloads/462-removebg-preview.png", "https://raw.githubusercontent.com/IvoVillanueva/nbapng/main/16761048-la-bandera-espan%CC%83ola-en-la-forma-de-un-icono-brillante-removebg-preview.png", "#ad1519",
  "SPA8", "/Users/ivo/Downloads/Captura_de_pantalla_2023-08-27_a_las_13.26.38-removebg-preview.png", "https://www.fiba.basketball/api/img/team/logoflag/0?sizeType=Big&backgroundType=Light&patternType=default_big&eventId=208182&iocCode=ESP", "#ad1519"
) %>%
  mutate(headshots1 = paste0("https://raw.githubusercontent.com/IvoVillanueva/nbapng/main/", tm, "-bg.png")) %>%
  select(tm, headshots = headshots1, logo)

# funcion para convertir las fotos en redondo y rellenar el background
#
# pic <- fotis$headshots
#
#   circulos <- function(pic){
#
#          color <- fotis |> filter(headshots == pic) |> select(color) |> distinct() |> pull()
#          name <- fotis |> filter(headshots == pic) |> select(tm) |> distinct() |> pull()
#
#            p <- circle_crop(
#                pic,
#                to  = paste0(name,"-bg.png"),
#                border_size = 4,
#                border_colour = color
#              )
#            return(p)
#          }
#
# circulos_img <- map(pic, circulos)

# una vez que consigo las fotos las subo a github y vuelvo a la tabla fotis he incluyo el mutate

# # ✍️ Tabla liga logos --------------------------------------------------------

tm_table <- tribble(
  ~lg, ~log,
  "NBA", "https://upload.wikimedia.org/wikipedia/fr/thumb/8/87/NBA_Logo.svg/langfr-270px-NBA_Logo.svg.png",
  "Euro U18", "https://upload.wikimedia.org/wikipedia/en/9/91/European_U-18_championship_logo_2012.png",
  "U19 WC", "https://upload.wikimedia.org/wikipedia/en/8/8e/2013_FIBA_Under-19_World_Championship_logo.jpg",
  "Euro U20", "https://upload.wikimedia.org/wikipedia/en/e/ee/2015_FIBA_Europe_Under-20_Championship_logo.png",
  "Euro2015", "https://upload.wikimedia.org/wikipedia/en/4/4c/EuroBasket_2015_logo.png",
  "Rio 2016", "https://upload.wikimedia.org/wikipedia/en/thumb/d/df/2016_Summer_Olympics_logo.svg/400px-2016_Summer_Olympics_logo.svg.png",
  "Euro2017", "https://raw.githubusercontent.com/IvoVillanueva/nbapng/main/hqe0PhuB9UGXWknhAoP5gg-removebg-preview.png",
  "world Cup 2019", "https://upload.wikimedia.org/wikipedia/en/thumb/6/60/FIBA2019WorldCup.svg/400px-FIBA2019WorldCup.svg.png",
  "Tokyo 2020", "https://img.olympicchannel.com/images/image/private/w_300/f_auto/v1552235080/primary/jux5g5vrxv5fnglq93yj",
  "wc japon", "https://seeklogo.com/images/F/fiba-world-cup-2023-logo-C0B89BE8EE-seeklogo.com.png",
  "ACB", "https://upload.wikimedia.org/wikipedia/en/7/71/ACB_logo.png"
)



# 🤼  Data scrap y Data Wrangling--------------------------------------------------------------

# Por partido NBA
wiporgame <- nba1 %>%
  read_html() %>%
  html_element("#per_game") %>%
  html_table() %>%
  clean_names() %>%
  slice(1:9) %>%
  select(season, age, tm, lg, g, mp, pts, trb, blk, ast)

# Por 100 posesiones NBA (algunas tablas en esta página estan subidas como comentarios, por eso la forma es diferente)
wiporposs <- nba2 %>%
  read_html() %>%
  html_nodes(xpath = "//comment()") %>%
  html_text() %>%
  paste(collapse = "") %>%
  read_html() %>%
  html_node("#per_poss") %>%
  html_table() %>%
  clean_names() %>%
  slice(1:9) %>%
  select(season, age, tm, lg, g, pts1 = pts, trb1 = trb, blk1 = blk, ast1 = ast, o_rtg, d_rtg)

# Advanced NBA
wiporadvanced <- nba3 %>%
  read_html() %>%
  html_element("#advanced") %>%
  html_table() %>%
  clean_names() %>%
  slice(1:9) %>%
  select(season, age, tm, lg, g, per)

# 🤝 Unión tablas NBA

winba <- wiporgame %>%
  left_join(wiporposs) %>%
  left_join(wiporadvanced) %>%
  mutate(season = substring(season, 3))



# Por partido acb proballers
wiporgame_acb <- pro1 %>%
  read_html() %>%
  html_element(".select-tab-content-regular-totals table") %>%
  html_table() %>%
  clean_names() %>%
  slice(1:4) %>%
  mutate(
    liga = ifelse(liga == "SPA-1", "ACB", ""),
    equipo = case_when(
      equipo == "Real Madrid" ~ "RMB",
      tempo == "13-14" ~ "CAJ",
      tempo == "14-15" ~ "BSE"
    ),
    age = case_when(
      tempo == "12-13" ~ "18",
      tempo == "13-14" ~ "19",
      tempo == "14-15" ~ "20",
      tempo == "15-16" ~ "21",
    )
  ) %>%
  select(season = tempo, tm = equipo, age, lg = liga, g = p, mp = min, pts, trb = reb, blk = tap, ast, per = val) %>%
  mutate(across(c(mp, pts, trb, blk, per, ast)) / g,
    pts1 = "🤷",
    trb1 = "🤷",
    blk1 = "🤷",
    ast1 = "🤷"
  )

# Por partido España proballers
wiporgame_int <- pro2 %>%
  read_html() %>%
  html_node(".select-tab-content-international-totals table") %>%
  html_table() %>%
  clean_names() %>%
  filter(!liga %in% c("Preparation", "WC-QR")) %>%
  slice(3:12) %>%
  mutate(
    equipo = ifelse(str_detect(equipo, "Spain"), "SPA", ""),
    age = case_when(
      tempo == "12-13" ~ "18",
      tempo == "13-14" ~ "19",
      tempo == "14-15" ~ "20",
      tempo == "15-16" ~ "21",
      tempo == "16-17" ~ "22",
      tempo == "17-18" ~ "23",
      tempo == "19-20" ~ "24",
      tempo == "21-22" ~ "25",
      tempo == "22-23" ~ "26",
      tempo == "21-22" ~ "27",
      tempo == "23-24" ~ "29"
    )
  ) %>%
  select(season = tempo, tm = equipo, age, lg = liga, g = p, mp = min, pts, trb = reb, blk = tap, ast, per = val) %>%
  mutate(across(c(mp, pts, trb, blk, per, ast)) / g,
    o_rtg = "🤷",
    d_rtg = "🤷",
    pts1 = "🤷",
    trb1 = "🤷",
    blk1 = "🤷",
    ast1 = "🤷"
  )


# Advanced acb real gm, te da no sé como 34 tablas, yo quiero la 26
df <- acb2 %>%
  read_html() %>%
  html_elements("table") %>%
  html_table()

wi_realgm <- df[[26]] %>%
  clean_names() %>%
  filter(league == "ACB") %>%
  mutate(
    season = substring(season, 3),
    season = str_squish(str_remove(season, "\\*")),
    team = case_when(
      team == "Real Madrid" ~ "RMB",
      season == "13-14" ~ "CAJ",
      season == "14-15" ~ "BSE"
    )
  ) %>%
  select(season, o_rtg, d_rtg)

# 🤝 Unión tablas acb nba e internacional

wi_total <- wiporgame_acb %>%
  left_join(wi_realgm) %>%
  rbind(wiporgame_int) %>%
  rbind(winba) %>%
  filter(tm != "TOT") %>%
  slice(1, 5, 2, 6, 3, 7, 4, 8, 15, 9, 16, 17, 10, 18, 19, 11, 20, 21, 12, 22, 14) %>%
  mutate(
    lg = case_when(
      season == "15-16" & tm == "SPA" ~ "Euro2015",
      season == "16-17" & tm == "SPA" ~ "Rio 2016",
      season == "17-18" & tm == "SPA" ~ "Euro2017",
      season == "19-20" & tm == "SPA" ~ "world Cup 2019",
      season == "21-22" & tm == "SPA" ~ "Tokyo 2020",
      season == "23-24" & tm == "SPA" ~ "wc japon",
      TRUE ~ lg
    ), tm = case_when(
      season == "12-13" & lg == "ACB" ~ "RMB",
      season == "12-13" & lg == "Euro U18" ~ "SPA",
      season == "13-14" & lg == "ACB" ~ "CAJ",
      season == "13-14" & lg == "U19 WC" ~ "SPA1",
      season == "14-15" & lg == "ACB" ~ "BSE",
      season == "14-15" & lg == "Euro U20" ~ "SPA2",
      season == "15-16" & lg == "ACB" ~ "RMB1",
      season == "15-16" & lg == "Euro2015" ~ "SPA3",
      season == "16-17" & lg == "NBA" ~ "NYK",
      season == "16-17" & lg == "Rio 2016" ~ "SPA4",
      season == "17-18" & lg == "NBA" ~ "NYK1",
      season == "17-18" & tm == "CHO" ~ "CHO",
      season == "17-18" & lg == "Euro2017" ~ "SPA5",
      season == "18-19" & lg == "NBA" ~ "CHO1",
      season == "19-20" & lg == "NBA" ~ "CHO2",
      season == "19-20" & lg == "world Cup 2019" ~ "SPA6",
      season == "20-21" & lg == "NBA" ~ "NOP",
      season == "21-22" & lg == "NBA" ~ "NOP1",
      season == "21-22" & lg == "Tokyo 2020" ~ "SPA7",
      season == "22-23" & lg == "NBA" ~ "NOP2",
      season == "23-24" & lg == "wc japon" ~ "SPA8"
    ),
    age = case_when(
      season == "19-20" ~ "25",
      season == "21-22" ~ "27",
      TRUE ~ age
    )
  ) %>%
  left_join(fotis) %>%
  left_join(tm_table) %>%
  mutate(round(across(c(mp, pts, trb, blk, per, ast)), 02))





# 📊 GT table ----------------------------------------------------------------
wh <- "<img src='https://raw.githubusercontent.com/IvoVillanueva/nbapng/main/3200x2000-basquet-Welcome_Willy-removebg-preview.png' style='height:260px;'" # foto de willy

wi_total %>%
  select(img = headshots, logo, log, season, age, g:ast, pts1:d_rtg, per) %>%
  gt() %>%
  gt_img_rows(img) %>%
  gt_img_rows(logo) %>%
  gt_img_rows(log) |>
  cols_label(
    img = "",
    logo = "",
    log = "",
    age = gt::html("<span style='font-weight:bold;font-dystopian:small-caps;font-size:16px'>age</span>"),
    season = gt::html("<span style='font-weight:bold;font-dystopian:small-caps;font-size:16px'>año</span>"),
    g = gt::html("<span style='font-weight:bold;font-dystopian:small-caps;font-size:16px'>Gms</span>"),
    mp = gt::html("<span style='font-weight:bold;font-dystopian:small-caps;font-size:16px'>mp</span>"),
    pts = gt::html("<span style='font-weight:bold;font-dystopian:small-caps;font-size:16px'>pts</span>"),
    trb = gt::html("<span style='font-weight:bold;font-dystopian:small-caps;font-size:16px'>trb</span>"),
    ast = gt::html("<span style='font-weight:bold;font-dystopian:small-caps;font-size:16px'>ast</span>"),
    blk = gt::html("<span style='font-weight:bold;font-dystopian:small-caps;font-size:16px'>blk</span>"),
    pts1 = gt::html("<span style='font-weight:bold;font-dystopian:small-caps;font-size:16px'>pts</span>"),
    trb1 = gt::html("<span style='font-weight:bold;font-dystopian:small-caps;font-size:16px'>trb</span>"),
    blk1 = gt::html("<span style='font-weight:bold;font-dystopian:small-caps;font-size:16px'>blk</span>"),
    ast1 = gt::html("<span style='font-weight:bold;font-dystopian:small-caps;font-size:16px'>ast</span>"),
    o_rtg = gt::html("<span style='font-weight:bold;font-dystopian:small-caps;font-size:16px'>ortg</span>"),
    d_rtg = gt::html("<span style='font-weight:bold;font-dystopian:small-caps;font-size:16px'>drtg</span>"),
    per = gt::html("<span style='font-weight:bold;font-dystopian:small-caps;font-size:16px'>val<br>per</span>")
  ) %>%
  tab_spanner(gt::html("<span style='font-weight:bold;font-dystopian:small-caps;font-size:16px'>por 100 posesiones</span>"),
    columns = c(pts1:d_rtg)
  ) %>%
  cols_align(
    align = "center",
    columns = c(everything())
  ) |>
  data_color(
    columns = c(per), # summary(jbtotal$per) para saber el mínimo y el máximo
    colors = scales::col_numeric(
      palette = paletteer::paletteer_d(
        palette = "nbapalettes::knicks",
        direction = -1
      ) %>% as.character(),
      domain = c(min(wi_total$per), max(wi_total$per)),
      na.color = "#005C55FF"
    )
  ) |>
  espnscrapeR::gt_theme_espn() |> # Me encanta gt por como te deja meter un montón de html y desde aquí hay un montón
  opt_row_striping(row_striping = TRUE) %>%
  tab_options(
    heading.align = "center",
    table.font.names = "Roboto Condensed",
    table.background.color = "white",
    table.font.size = 14,
    data_row.padding = px(1),
    source_notes.font.size = 10,
    table.additional_css = "
     .gt_table {
                margin-bottom: 40px;

               }
     #title-text {

                padding-bottom: 2px;
                margin-top: -12px;
                font-weight:bold;
                font-size:25px;

               }"
  ) %>%
  tab_header(
    html(paste0(
      wh, "<br>",
      "<div id='title-text'>",
      "Sus números desde el 2012 al 2023",
      "</div>"
    ))
  ) %>%
  tab_source_note(
    source_note = md(" <span style='font-weight:bold;font-dystopian:small-caps;font-size:14px'>**Datos**: </span>
    <span style='font-dystopian:small-caps;font-size:14px'>*@RealGM*</span>
    &nbsp;&nbsp; <img src='https://basketball.realgm.com/images/basketball/5.0/template/realgm-basketball-logo-175-80.png'
                     style='height:12px;'>
                     &nbsp;&nbsp;<span style='font-dystopian:small-caps;font-size:14px'>, &nbsp;&nbsp;*@bball_ref*</span>&nbsp;&nbsp;<img src='https://cdn.ssref.net/req/202308191/logos/bbr-logo.svg'
                     style='height:12px;'><span style='font-dystopian:small-caps;font-size:14px'>, &nbsp;&nbsp;*@Proballers_com*</span>
                     <img src='https://www.proballers.com/images/proballers-blue.svg' style='height:12px;'><br>
                     <span style='font-weight:bold;font-dystopian:small-caps;font-size:14px'>**Gráfico**: </span>
                     <span style='font-size:14px'>*Ivo Villanueva*</span>&nbsp;&nbsp;&bull;
                     <span style='color:#000000;font-family: \"Font Awesome 6 Brands\"'>&#xE61B;</span> <span style='font-weight:bold;font-size:14px'>*@elcheff*</span>
                     &nbsp;&nbsp;&bull;
                     <span style='color:#8134AF;font-size:14px;font-family: \"Font Awesome 6 Brands\"'>&nbsp;&nbsp;&#xF16D;</span>
                     <span style='font-weight:bold;font-dystopian:small-caps;font-size:14px'>*@sport_iv0*</span>")
  ) |>
  espnscrapeR::gt_theme_espn() |> # Me encanta gt por como te deja meter un montón de html y desde aquí hay un montón
  opt_row_striping(row_striping = TRUE) %>%
  tab_options(
    heading.align = "center",
    table.font.names = "Roboto Condensed",
    table.background.color = "white",
    table.font.size = 14,
    data_row.padding = px(1),
    source_notes.font.size = 10,
    table.additional_css = "
     .gt_table {
                margin-bottom: 40px;

               }
     #title-text {

                padding-bottom: 2px;
                margin-top: -10px;
                font-weight:bold;
                font-size:35px;

               }"
  ) %>%
  tab_footnote(
    footnote = "Valoración corresponde para sus partidos Fiba o ACB y el PER para los de la NBA",
    locations = cells_column_labels(columns = per)
  ) %>%
  gtsave("wHerInsta.png", expand = 50, vwidth = 1080, vheight = 1350, cliprect = "viewport")
