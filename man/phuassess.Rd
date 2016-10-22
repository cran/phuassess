\name{phuassess}
\alias{phuassess}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
phuassess
}
\description{
Performs the permutation-based combination of sign tests for assessing habitat selection (Fattorini et al., 2014).
}
\usage{
phuassess(used, avail, hnames = FALSE, exactperm = TRUE, nrperm = 100000, 
	alpha = 0.05)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{used}{
a matrix describing the percentage - or proportion - of use of habitats
(in columns) by animals (in rows).
}
  \item{avail}{
a matrix describing the percentage - or proportion - of availability of
habitats (in columns) by animals (in rows).
}
  \item{hnames}{
logical. If TRUE \code{used} and \code{avail} are matrices with habitat names as column headers. If FALSE \code{used} and \code{avail} are matrices without column headers. By default \code{hnames} = FALSE.
}
  \item{exactperm}{
logical. If TRUE the exact permutation distribution of the test statistic
is computed on the basis of all the possible \eqn{2^n} sign choices, where \eqn{n}
denotes the number of animals. If FALSE the permutation distribution
is estimated by using a random sample of \code{nrperm} sign choices. By
default \code{exactperm} = TRUE. The exact permutation distribution
can be computed for \eqn{n < 32}.
}
  \item{nrperm}{
number of random sign choices adopted to estimate the permutation
distribution of the test statistic. By default \code{nrperm} = 100000.
}
  \item{alpha}{
significance level used to assess the partial hypothesis concerning
each habitat type. By default \code{alpha} = 0.05.
}
}
\details{
The analysis of habitat selection is approached by comparing the portions of use against the portions of availability observed for each habitat type in order to assess if the habitat types are all used proportionately to their availability - the so called proportional or random habitat use - or if there is preference/avoidance of some habitat types. As pointed out by Johnson (1980), the analysis can be performed at different levels of choices comparing a) the portion of each habitat within the home range - representing habitat use - versus the available portion within a delineated study area - representing habitat availability (Johnson's second order selection); b) the portion of each habitat use - representing habitat use - versus the corresponding portion within the home range - representing habitat availability (Johnson's third order selection). 	

In order to overcome the drawbacks of the procedure proposed by Aebischer et al. (1993), Fattorini et al. (2014) suggest an alternative approach according to which the overall hypothesis of proportional habitat use is expressed in terms of the intersection of partial hypothesis regarding each habitat type.

Each partial null hypothesis is assessed by means of the sign test performed on the original data and its acceptance means that animals use that habitat in a proportion which has the same probability of being greater or less than the proportion of its availability, so that no habitat selection or avoidance can be claimed. In particular, for each habitat, the test statistic is the maximum between the number of animals with use greater than availability and the number of animals with availability greater than use. The p-value can be straightforwardly derived by means of the binomial probability distribution with parameters equal to the number of animals having that habitat in their availability and 0.5.
In order to combine the p-values resulting from the partial tests into a statistic for assessing the overall hypothesis of proportional habitat use, the permutation procedure proposed by Pesarin (2001) is applied, giving rise to a completely nonparametric test. In particular, the test statistic for assessing the overall hypothesis is the minimum among the partial p-values. Its significance is determined by means of its permutation distribution, which can be obtained considering either all the possible sign choices to be attributed to the differences between used and available habitat (if the number of animals is less than 32) or a random sample of those sign choices. 

When the p-value of the overall test allows rejection of the proportional habitat use hypothesis, the p-values of each partial hypothesis can be considered. More precisely, if the p-value of the partial test is greater than a prefixed significance level \code{alpha}, that habitat is classified as \dQuote{proportionally used}. When the p-value is smaller than or equal to \code{alpha}, the habitat is classified as \dQuote{preferred} if the proportion of animals with use greater than availability is greater or equal to 0.5 and as \dQuote{avoided} if the proportion is less than 0.5. Obviously, the analysis of the resulting classification makes sense only if the overall hypothesis has been rejected.

Finally, a further less formal ordering is performed - once again by using the permutations of the sample data already adopted for the assessment of the overall hypothesis - on the set of preferred and avoided habitats for ranking the habitat types according to animals preferences. 

}
\value{
The \code{phuassess} function returns a list with the following components:

\item{used}{the matrix of used habitats.}
\item{avail}{the matrix of available habitats.}
\item{pvalue.overall}{the p-value resulting from the assessment of the overall hypothesis of proportional habitat use.}
\item{ordering}{the data frame where in the first column habitat types are reported, grouped in preferred, proportionally used and avoided habitat types (the classification is reported in the last column of the data frame) and ranked according to the proportion of animals which use the habitat in a greater proportion than its availability, which is reported in the second column. As to the values reported from the third to the penultimate column, which form a square matrix of size equal to the number of habitat types, values on the diagonal represent the p-values for each partial hypothesis of proportional habitat use, while non diagonal values represent p-values for paired comparisons among habitat types. }
\item{noss}{vector. For each habitat type the corresponding vector element is the number of differences between percentages or proportions of used and available habitat not equal to zero. It represents the actual number of observations used for assessing the partial hypothesis of proportional habitat use.}
\item{npos}{vector. For each habitat type the corresponding vector element is the number of differences between percentages (or proportions) of used and available habitat greater than zero.}
\item{type.perm}{a character string. Either \dQuote{exact permutation distribution} or \dQuote{estimated permutation distribution}.}
\item{nperm}{the number of sign choices adopted to estimate the permutation distribution of the test statistic.}
\item{alpha}{the significance level used to assess the partial hypothesis of proportional habitat use.}

%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
Aebischer N.J., Robertson P.A., Kenward, R.E. (1993). \emph{Compositional analysis of habitat use from animal radio-tracking data.} Ecology 74: 1315-1325.\cr
Fattorini L., Pisani C., Riga F., Zaccaroni M. (2014). \emph{A permutation-based combination of sign tests for assessing habitat selection.} Environmental and Ecological Statistics 21: 161-187.\cr
Fattorini L., Pisani C., Riga F., Zaccaroni M. (2017). \emph{The R package \dQuote{phuassess} for assessing habitat selection using permutation-based combination of sign tests.} To appear.\cr
Johnson D.H. (1980). \emph{The comparison of usage and availability measurements for evaluating resource preference}. Ecology 61: 65-71.\cr
Pesarin F. (2001). Multivariate permutation tests: with applications in biostatistics. New York: Wiley. 
}
\author{
Caterina Pisani [aut, cre]
Lorenzo Fattorini [aut]
Francesco Riga [aut]
Marco Zaccaroni [aut]
}
\note{
If the number of animals is large - even if not greater than 31 - computing the exact permutation distribution can be very time-consuming 
and the estimation of the permutation distribution by means of a random sample of \code{nrperm} sign choices is mandatory.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

%%\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
%%see also DA MODIFICARE
%%}

\examples{
## The following examples are the habitat selection analysis of 14 hares in 
## the protected area of Spicciano (Tuscany, Central Italy) reported in
## Fattorini et al. (2017). 


data(hares)

##############################################################################
## Second order habitat selection: study area vs home range 
## In order to save computation time, only a sample of 5000 permutations
## is considered, while the results reported in the paper refer to all the 
## possible 16.384 permutations.

second_order <- phuassess(hares$PAHR, hares$study_area, hnames=TRUE, 
exactperm = FALSE, nrperm = 5000)

## Overall p-value for the assessment of the hypothesis of proportional
## habitat use
second_order$pvalue.overall

## Overall p-value allows the rejection of the hypothesis of proportional
## habitat use. The data frame containing the p-values for each partial
## hypothesis and for the paired comparisons among habitat types, together
## with habitat ordering, can be considered.
second_order$ordering

##############################################################################
## The following commented examples refer to third order habitat selection: 
## percentages of radio locations vs home range
## All the possible 16.384 permutations are considered

## Day
#third_order_day <- phuassess(hares$PAT_day, hares$PAHR, hnames=TRUE)

## Overall p-value for the assessment of the hypothesis of proportional
## habitat use
#third_order_day$pvalue.overall

## Overall p-value does not allow the rejection of the hypothesis of 
## proportional habitat use. As the p-value is considerably near the 
## critical value of 0.05, instead of mechanistically precluding further 
## insights, the marginal tests are also considered.
#third_order_day$ordering

## Night
#third_order_night <- phuassess(hares$PAT_night, hares$PAHR, hnames=TRUE)

## Overall p-value for the assessment of the hypothesis of proportional 
## habitat use.
#third_order_night$pvalue.overall

## Overall p-value allows the rejection of the hypothesis of proportional
## habitat use. The data frame with the p-values for partial hypotheses and
## paired comparisons, together with habitat ordering, can be considered.
#third_order_night$ordering

}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ habitat selection }
\keyword{ proportional habitat use }
\keyword{ permutation-based combination of sign tests }
\keyword{ multiple test approach }
\keyword{ nonparametric test }
