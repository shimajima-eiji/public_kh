package main

/* スクレイピングロジックは変わってません */

func main() {
    var tables []string

    /* スクレイピングロジックは変わってません */

    year := "2018"  // TODO Pythonでやったクールな方法が分からない
    month := strings.Replace(utf8string.NewString(label).Slice(0, 2), "月", "", 1)
    day := strings.Replace(utf8string.NewString(label).Slice(2, 4), "日", "", 1)  // TODO 10月になったら3,5に変更する必要があるやも。イケてない
    under_10 := scraping()
    over_10 := scraping()

    // TODO この辺をもっときれいにやりたい。１行に圧縮するのは楽だけど…
    str := "|"
    str += year
    str += "|"
    str += month
    str += "|"
    str += day
    str += "|"
    str += under_10
    str += "|"
    str += over_10
    str += "|"

    tables = append(tables[:], str)

    // TODO 配列を逆順にしたい
    fmt.Println(tables)
