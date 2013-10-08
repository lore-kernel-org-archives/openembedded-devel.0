Return-Path: <eric@eukrea.com>
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
	by mail.openembedded.org (Postfix) with ESMTP id E40D16CABC
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 06:24:49 +0000 (UTC)
Received: from e6520eb (unknown [82.233.81.124]) (Authenticated sender: eukrea)
	by smtp5-g21.free.fr (Postfix) with ESMTPSA id 849B2D4820C;
	Tue,  8 Oct 2013 08:24:43 +0200 (CEST)
Date: Tue, 8 Oct 2013 08:24:42 +0200
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20131008082442.3283605a@e6520eb>
In-Reply-To: <20131008001604.GJ18775@denix.org>
References: <1381188738-29468-1-git-send-email-eric@eukrea.com>
	<20131008001604.GJ18775@denix.org>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.9.2 (GTK+ 2.24.19; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 01/18] qtgraphicaleffects: allow empty package
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
X-List-Received-Date: Tue, 08 Oct 2013 06:24:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Le Mon, 07 Oct 2013 20:16:04 -0400,
Denys Dmytriyenko <denis@denix.org> a =E9crit :

> And the series misses qtquickcontrols-5.1.0, qtserialport-5.1.0 and=20
> qttools-native-5.1.0 - those require qt5-${PV}.inc which is now renamed a=
nd it=20
> breaks parsing...
>=20
I'll rebase the serie, sorry I was on dora branch.

Eric=20

