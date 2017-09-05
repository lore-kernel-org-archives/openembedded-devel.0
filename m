Return-Path: <prvs=4145d141b=Mikko.Rapeli@bmw.de>
X-Greylist: delayed 588 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 05 Sep 2017 06:53:16 UTC
Received: from esa2.bmw.c3s2.iphmx.com (esa2.bmw.c3s2.iphmx.com
	[68.232.133.169])
	by mail.openembedded.org (Postfix) with ESMTP id 3CFAD77F90
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Sep 2017 06:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1504594400; x=1536130400;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=qY4/HPOEiNl74o5mnTWJjcAWCt3Gm+nNrQXGKEZyVTE=;
	b=lHTuOWSNbo+HxGZgu6SDF+eOr5msFJzRVGfWtvrhCf0Nn8YUNTBFQdZO
	slL3epfRkq5yBr5iMFCuAQbU9Z0Cup3wKnZFDBNTesnv/spbL8t8nKKp+
	FlosXXAYWhmcBhfBun1IFNyGfBcMMV+q0WRiaV8oXaZU0qBPOsVuoPiFE c=;
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
	esa2.bmw.c3s2.iphmx.com with ESMTP/TLS; 05 Sep 2017 08:43:29 +0200
Received: from esabb1.muc ([160.50.100.31])  by esagw4.muc with ESMTP/TLS;
	05 Sep 2017 08:43:28 +0200
Received: from smucm10j.bmwgroup.net (HELO smucm10j.europe.bmw.corp)
	([160.48.96.46])
	by esabb1.muc with ESMTP/TLS; 05 Sep 2017 08:43:27 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10j.europe.bmw.corp
	(160.48.96.46) with Microsoft SMTP Server (TLS;
	Tue, 5 Sep 2017 08:43:27 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1320.000;
	Tue, 5 Sep 2017 08:43:27 +0200
From: <Mikko.Rapeli@bmw.de>
To: <akuster808@gmail.com>
Thread-Topic: [oe] [PATCH] cve-check.bbclass: detect patched CVE's also from
	patch file names
Thread-Index: AQHTIy6fPSSZuXc9JUCBtUcCBoMHHqKlRWcAgAB3Q4A=
Date: Tue, 5 Sep 2017 06:43:27 +0000
Message-ID: <20170905064327.tm5tmd3jptaltiee@hiutale>
References: <1504276118-29353-1-git-send-email-mikko.rapeli@bmw.de>
	<6a31d1c8-0b36-df07-42d6-2b5b2a28585b@gmail.com>
In-Reply-To: <6a31d1c8-0b36-df07-42d6-2b5b2a28585b@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.44.101]
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] cve-check.bbclass: detect patched CVE's also from patch file names
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
X-List-Received-Date: Tue, 05 Sep 2017 06:53:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D160550B42B5BB4DBD279F02DF19388D@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 04, 2017 at 04:36:36PM -0700, akuster808 wrote:
> Mikko,
>=20
> wrong ML. I think you want openembedded-core@lists.openembedded.org

Yep, resent to oe-core yesterday:

http://lists.openembedded.org/pipermail/openembedded-core/2017-September/14=
1739.html

-Mikko=

