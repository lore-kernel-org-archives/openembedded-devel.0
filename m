Return-Path: <tobias.andersson@multiq.com>
Received: from mail1.bemta3.messagelabs.com (mail1.bemta3.messagelabs.com
	[195.245.230.174])
	by mail.openembedded.org (Postfix) with ESMTP id 05CC060119
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jul 2016 13:15:24 +0000 (UTC)
Received: from [85.158.137.3] by server-14.bemta-3.messagelabs.com id
	D5/DC-07949-C640D775; Wed, 06 Jul 2016 13:15:24 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrPIsWRWlGSWpSXmKPExsVy2HCNuW4OS22
	4wcqzYhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bzq8vYCt6LV7R9WsDcwPhYtIuRk0NIYDqj
	xL+XVV2MHBxsAiYSq9ZbgYRFBGIklp4/zwZiCwsoSbz+sI4dIq4uMeHtPyjbSeLyhHusIDaLg
	IrEp48nWEBsXoEgib0td9ghxj9glFi4VR7E5hQIlrh9eQ0jiM0oICtx//s9sHpmAXGJz3MfMI
	HYEgICEkv2nGeGsEUlXj7+xwphy0tMm9/CBlGfJ7Hm1Cw2iF2CEidnPmGZwCg4C8moWUjKZiE
	pg4jrSdyYOoUNwtaWWLbwNTOErSsx498hFmTxBYzsqxjVi1OLylKLdA31kooy0zNKchMzc3QN
	DYz1clOLixPTU3MSk4r1kvNzNzECI4IBCHYwLv/odIhRkoNJSZSX5Vt1uBBfUn5KZUZicUZ8U
	WlOavEhRhkODiUJ3itMteFCgkWp6akVaZk5wNiESUtw8CiJ8H4ASfMWFyTmFmemQ6ROMSpKif
	PeAkkIgCQySvPg2mDp4BKjrJQwLyPQIUI8BalFuZklqPKvGMU5GJWEea+BTOHJzCuBm/4KaDE
	T0OKfLtUgi0sSEVJSDYySd3edmxF42Ob6Aat0gZlHhTSXls+qXViwyPtEmO/5tYfz0j7MuVGm
	I6i5t9te83S6m2K/z67Qtd5Vz3vzVs/W72hZkTk5fk0zh9Lp27u2sHYXGc0JYbM9KMf0eqrun
	8h5wu5p3jfZWwWulGwRDDindzk4MrspeMP8jv37N5x8dtbRRTp6BrMSS3FGoqEWc1FxIgANnd
	RdAgMAAA==
X-Env-Sender: tobias.andersson@multiq.com
X-Msg-Ref: server-5.tower-38.messagelabs.com!1467810923!23365621!1
X-Originating-IP: [195.49.172.55]
X-StarScan-Received: 
X-StarScan-Version: 8.46; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9711 invoked from network); 6 Jul 2016 13:15:24 -0000
Received: from unknown (HELO exch02-esl-se.Multiq2.local) (195.49.172.55)
	by server-5.tower-38.messagelabs.com with AES256-SHA encrypted SMTP;
	6 Jul 2016 13:15:24 -0000
Received: from exch02-esl-se.Multiq2.local ([::1]) by
	exch02-esl-se.Multiq2.local ([::1]) with mapi id 14.03.0224.002;
	Wed, 6 Jul 2016 15:15:23 +0200
From: Tobias Andersson <tobias.andersson@multiq.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][krogoth][issue]
Thread-Index: AdHXdwKkkt/wsnFLRsetlGXEPkoahwAAbUaTAAL9nUwAAO4QMw==
Date: Wed, 6 Jul 2016 13:15:22 +0000
Message-ID: <A126740DBD3CFF4C92C08C03B00BC6C80135FF3C@exch02-esl-se.Multiq2.local>
References: <A126740DBD3CFF4C92C08C03B00BC6C80135FD79@exch02-esl-se.Multiq2.local>,
	<A126740DBD3CFF4C92C08C03B00BC6C80135FDEE@exch02-esl-se.Multiq2.local>,
	<A126740DBD3CFF4C92C08C03B00BC6C80135FE70@exch02-esl-se.Multiq2.local>
In-Reply-To: <A126740DBD3CFF4C92C08C03B00BC6C80135FE70@exch02-esl-se.Multiq2.local>
Accept-Language: sv-SE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [85.235.1.83]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-oe][krogoth][issue]
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Jul 2016 13:15:25 -0000
Content-Language: sv-SE
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I have an issue with php-cgi failing on execute with error msg:

php-cgi: relocation error: php-cgi: symbol mysql_server_init, version libmy=
sqlclient_16 not defined in file libmysqlclient.so.18 with link time refere=
nce

libmysqlclient.so.18 comes from mariadb
branch is krogoth


Med v=E4nlig h=E4lsning/ Kind Regards

Tobias Andersson

Software Developer

Direct: +46 (0)10 211 66 05
Office: +46 (0)10 211 66 00

tobias.andersson@multiq.com

www.multiq.com

