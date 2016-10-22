\name{hares}
\alias{hares}
\docType{data}
\title{
Radio-tracking data of European Brown Hares
}
\description{
This dataset refers to the use and availability of 7 habitat types for 14 hares monitored by radio-tracking in the area of Spicciano, Tuscany (Central Italy). 
}
\usage{data(hares)}
\format{
This list has four components:
\describe{
	\item{\code{study_area}}{ a data frame giving the percentage of each habitat type (in columns) on the study area. These percentages are repeated by rows, for all the animals (in rows). The habitat types are woodland, scrubland and hedges, winter cereals, extensive fruit crops,	intensive fruit crops, meadows and fallow fields.}
	\item{\code{PAHR}}{a data frame giving the percentage of each habitat type (in columns) in the home range of each animal (in rows).}
	\item{\code{PAT_day}}{a data frame giving the percentage of the radio-locations of each animal (in rows) for each habitat type (in columns) during day.}
	\item{\code{PAT_night}}{a data frame giving the percentage of the radio-locations of each animal (in rows) for each habitat type (in columns) during night.}
}
}
\details{
The European hare is generally nocturnal and crepuscular with daytime resting periods. Therefore, radio-localizations were classified as \dQuote{nocturnal} or \dQuote{diurnal} on the basis of the time of sunset and sunrise (according to the date and latitude), excluding those collected in crepuscular time slots. 
}
\source{
Fattorini L., Pisani C., Riga F., Zaccaroni M. (2017). \emph{The R package \dQuote{phuassess} for assessing habitat selection using permutation-based combination of sign tests.} To appear.
}

