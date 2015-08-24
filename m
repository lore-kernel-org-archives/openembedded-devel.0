Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0117.outbound.protection.outlook.com [157.55.234.117])
	by mail.openembedded.org (Postfix) with ESMTP id 04CC66AC1E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 09:29:27 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@theqtcompany.com; 
Received: from piippo.it.local (91.217.248.11) by
	DB5PR02MB1174.eurprd02.prod.outlook.com (10.162.163.20) with Microsoft
	SMTP Server (TLS) id 15.1.243.23; Mon, 24 Aug 2015 09:13:55 +0000
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 24 Aug 2015 12:13:56 +0300
Message-ID: <72ee73e0af8de8f40926c42d6b7c7d99f8f9009c.1440407387.git.samuli.piippo@theqtcompany.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1440407387.git.samuli.piippo@theqtcompany.com>
References: <cover.1440407387.git.samuli.piippo@theqtcompany.com>
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: AM3PR01CA040.eurprd01.prod.exchangelabs.com (10.141.191.30)
	To DB5PR02MB1174.eurprd02.prod.outlook.com (25.162.163.20)
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1174;
	2:iUqDMq1cQmZgN/OfsCAu/8JHuW+bDTT19atJDVW55Oi8l53Wj2j/4AeMZceCt85otrnq3DI7XqQ/uNRy7fBvqNPU/wNUsDIaY5tk/XG6hXfkLjni/9IUSo0ButWbfDEzwlCpkjz6dN6wyZpQ8M2Di8hAFcdikVz2AjHZv/XYAMw=;
	3:ZaygKGEBrLxGeRsYDh1CifRBQEQlJzHp5pIpgD+0B/bVaVxYnkOZbej4dn/IGPYMfttQwtEBKOFRUsFuc9ESjq7jQSu4lAkx4CaaUIDZvyN5gsrvwdFY5rln5TCc1yaX2T8E2guPdpdEGiQfbtw+jw==;
	25:mUv1153x39CjuRdFSzBTbgNXa3i2VZq2zovwprorE+7fnAIOzQ8VHLe1nFSoObmRuGgxNWXidOPMJ30BZVhrZG1yP21K25vLv28dRyS0/qaXMLs+ffrF5e+k3rHVxJpEEDf7GwMcjHQ3gac+Vs4cJacIQ56Ly4KvuH8VDp4pQ/HkwRoyfbbRfpPwozVrUTDnEr/1lK9T6qDzLk6ydvHbnkvsJf1O8dCHf2ctH2CvgstzjbfBrrGMo1vITZbL79G48SI3b4sWSOV7xRrhhIAxPA==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB5PR02MB1174;
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1174;
	20:0nvH9dL4b9g1m/yy03viH8wNs7dXGtgIIkutliFsGWKVSeHwoAO5U9nCovWgFYMongWkn/w1+8/v6cf+6cdtAtpzlzon1GgWVA/yI2lIgkbbI01paF0DVvpnKdymnFz73ddDO1vocBHDslVEsEqDw5o4lkRJtiEdknaLxksu3ZZns+ksLEcLnuL7QNKo6weHyGBmGLPvntm2zhblPnwsUEZH3ZFt03ZMSLCyhPBgplsjYIKJIUbHVzyxCvn5npGi99RV5YZiblrfeP+iQVeqGNIyE7eRpHvZzcNkWcmsOMFlXSIPpUltzLCmYquj6aXQJuXEy96fb3i8kE2/Jk+f4IY0GWSUjyOhpySw7WeB0dxvkHp8nMv3ZsT6m/Uj9ONZbX3yeAMvKl0D2sYwXQ1nZWM5SiKzGrFzNQ/tPpQdAQyYx2sPuiGLtcxEKMDDodI64TwEWHLjuv1fHbti2KJFWaSKH7iUQe+igNheXl9iOkjzPT+38J2n4hXptm52QJ7S;
	4:Dp8WK++yncjDtPK82fwLIfug+ylkVWS8NiQsgwMmL0kOTH3BlOGQTYigFTj3cT9/xGTMmQdYrEzXIKAuhqwFG22D6FZg3hhj7DkQ6oJH1sk7EUJnY91pLZtdikPGNVRoaGQ51xSRwtsjL3VSI/hIAAb8IrKs7TT3FZkTiP/Y75niBagIcBWj7hRao6zfljDT/YLJ4eiLi0h+2+GjFAIMeetlySTBGBqJeFwRs7V1rj3t3y1ZUFX92v5czoLAL287vTPMh6CoZ/Jk/Ez1xfHPHD3vp/WEv2vyUEVrK7IB8JIWK8POCzLIJYWnWqdz5N7d
X-Microsoft-Antispam-PRVS: <DB5PR02MB117454695532C944B6DB955A90620@DB5PR02MB1174.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(8121501046)(5005006)(3002001);
	SRVR:DB5PR02MB1174; BCL:0; PCL:0; RULEID:; SRVR:DB5PR02MB1174; 
X-Forefront-PRVS: 06780E24F8
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(189002)(64706001)(46102003)(5004730100002)(40100003)(47776003)(66066001)(5007970100001)(106356001)(50466002)(2351001)(105586002)(122386002)(229853001)(48376002)(101416001)(77156002)(92566002)(97736004)(62966003)(450100001)(118296001)(5001860100001)(77096005)(50226001)(110136002)(5001960100002)(107886002)(4001540100001)(68736005)(36756003)(19580405001)(81156007)(189998001)(5001920100001)(33646002)(19580395003)(5001830100001)(42186005)(5003940100001)(87976001)(2950100001)(86362001)(76176999)(50986999)(7099028)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB5PR02MB1174; H:piippo.it.local;
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: theqtcompany.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB5PR02MB1174;
	23:ICTpISEngrledEPeF+NrqySM0ABwlpc6irZkNBZAp?=
	=?us-ascii?Q?3MD8g9ylTfIZ4gzByks5cxai24ToZ/NbGMxttVFl3vc831OHK3Jp16G/p0E+?=
	=?us-ascii?Q?K5jiup6HtcSzQP4Pi/aE1KOdOCxf6z0StZC9yjHya5GJYSgL7FEqYKcY+vfh?=
	=?us-ascii?Q?/lCSXaVI6kkoYJQnuKSjnHBIQbOlWTM+JVehuCavsmW7vWqa0TNSLkFmmQAl?=
	=?us-ascii?Q?wfhOHwA43OJ8B/6eAMZE3zmPo4pY8YWc2CMQuckN/r1SiELfExM1vQlAYPg2?=
	=?us-ascii?Q?gjqmORxeHJncHRpipWm9jqbnuf89KPkElEbnv5tUUierI74OVcfHYq6rTtHu?=
	=?us-ascii?Q?aD4bIQLxuzjzth6XfFtzUUL+P2xf70TvBHexiFlyv6rMv1s2ZZxEQR57Dm40?=
	=?us-ascii?Q?EO4i9b+DU8nW8zwQ3UzTsSI8l+ls32mH/dSr2tH8bu6A0rEhm5jVeWFZLES5?=
	=?us-ascii?Q?Uo+x+EwLsOcJN/O/ns+83bdprc0cWlcRVLrU/Ku/SRPuhOiaHc/iwFDV5nzH?=
	=?us-ascii?Q?mnrP9UBymP/aAnKoIW99r92MO+LsX1QhxFTvfkX9ly31lGgXB2qngRLZg0P1?=
	=?us-ascii?Q?7qfzeKpNngLjnN5Q2x47nyZ9JH0v9AMsDElVjJhkmKL62kVFs4j2Hz4hDMms?=
	=?us-ascii?Q?eSAvq68hocyYAeQKCf6+rElwOswVY12P/9RR43RqVFXcEwZ+UXEYYvGYmdl7?=
	=?us-ascii?Q?0yRef9h7If2WagXQ7FoQbbfVp9P9SiRX8Xdgk8/SBWGuh0DudK3BJ3N6szv3?=
	=?us-ascii?Q?Pr96DsfYAtB9rP2/1F23b+0V0NQGj3Qg2n82nQ57qGH6tBYNAq2W0cdEcH0c?=
	=?us-ascii?Q?eGYY5XrvNAoxNZtF3mxsGx6wW9+wcKWFw6MNiQbsC0Vs3ImTo3RDWWS9PPjE?=
	=?us-ascii?Q?D6pAMiPtyOjzPq/razvMZJslO/SVffcnbaAqkjH93SKULpB4VXI03vFZAi/g?=
	=?us-ascii?Q?YZKf/lbcEHuaqYammhTgXpaCsCOkMWqTKf/AGoLx1V71dOD0oQ3L1lRTPPZU?=
	=?us-ascii?Q?JG941ousfGe+S4m5dDP1KJrS9Cqz9NbCHq1HGQShP689tktlaPuhVmsg2NG2?=
	=?us-ascii?Q?RQdksoq4n71lFknuxpTiA7BwEEYxzCiFJ1KZ0LZyGiyY86Bc/j8Qg7WtU7Ub?=
	=?us-ascii?Q?cwgRXROv/dMSEmi10oGM1EAYiibDceiy5bKEETJEDHIcIEpT1WOJhoSjSCK4?=
	=?us-ascii?Q?CIbBUZ/IoNd4lXtOeB2QlVW05Dcz+rnxNmu56gCvojC8a7QjixWz1CjA0Q59?=
	=?us-ascii?Q?1WUWjj3K6ppAO8rd1IOe2q++Sj1T2gJDx+og2iFxvkO8LZNuBDroHNAJ6NUq?=
	=?us-ascii?Q?gk3mbIpJoMmX8JvY2KiZbc=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1174;
	5:LIsNTMRhY5Dj9UwAmstU1uwEZt8fMQ8HLTQ9GtNiOIFDKRGidG3OvVfKWYWSeFdoAGK/qGA3dadd/0EzJZ4U15FR8DZHjJQLlCJgNDuRwbpU+RPpt02P7/QCVXkKp7qALDU21HKwdDgJBQB59teKBQ==;
	24:8BBBbYzdO4N/eUu9Gl9XgsKRlD+KmvuGyZfleywSnU3HiNelzizWdUW4l+RKghYAZuJ6nqq4s6Grkd8lRtxEXz20FGx+LBR6n7Hpq6Vmy3E=;
	20:0yIYf4doqKkYLxWyYAh3xrGF3jITx/VfqHyIcRcBgA+5lDJo0fDuNPBP+meaCUvPf9RzRa6Doun+7zpJ5gVyKw==
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2015 09:13:55.4126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR02MB1174
Subject: [meta-qt5][PATCH 10/11] qtlocation: use correct dependencies
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Aug 2015 09:29:30 -0000
Content-Type: text/plain

Update dependencies for QtLocation module based on the sync.profile

Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
---
 recipes-qt/qt5/qtlocation_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index 0264b93..c7773f2 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -10,8 +10,7 @@ LIC_FILES_CHKSUM = " \
     file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
 "
 
-DEPENDS += "qtbase qt3d"
-# qtsystems qtmultimedia
+DEPENDS += "qtbase qtxmlpatterns qtdeclarative qtquickcontrols"
 
 PACKAGECONFIG ??= ""
 # older geoclue 0.x is needed
-- 
1.9.1


