use context essentials2021
include gdrive-sheets
include data-source
include tables
include shared-gdrive("dcic-2021", "1wyQZj_L0qqV9Ekgr9au6RX2iqt2Ga8Ep")
ssid = "1RYN0i4Zx_UETVuYacgaGfnFcv4l9zd9toQTTdkQkj7g"
kWh-wealthy-consumer-data =
load-table: komponent, energi
source: load-spreadsheet(ssid).sheet-by-name("kWh", true)
  end

event-data =
  load-table: komponent, energi
    source: load-spreadsheet(ssid).sheet-by-name("kWh", true)
    sanitize energi using string-sanitizer
    sanitize komponent using string-sanitizer
  end


fun set-angle(s):
  cases(Option) string-to-number(s):
    | some(a) => a
    | none => 0
  end
where:
  set-angle("") is 0
  set-angle("30") is 30
  set-angle("37") is 37
  set-angle("5") is 5
  set-angle("4") is 4
  set-angle("15") is 15
  set-angle("48") is 48
  set-angle("12") is 12
  set-angle("4") is 4
end

numbers = transform-column(event-data, "energi", set-angle)

sum-uten-bil = sum(numbers, "energi")

fun bilforbruk(kWhperkilo, kgperliter, kWhperliter):
  kWhperkilo * kgperliter * kWhperliter
end

forbruk-bil = bilforbruk(8, 0.8, 7)

bil-energi = forbruk-bil



energi-kolonne = numbers.get-column("energi").set(0,bil-energi)

ny-tabell = [table-from-columns:
  {"komponent"; numbers.get-column("komponent")},
  {"energi"; energi-kolonne}
]

sum(ny-tabell, "energi")
ny-tabell

bar-chart(ny-tabell, "komponent", "energi")











  

















