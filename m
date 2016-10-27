Return-Path: <Sam.Lin@emerson.com>
X-Greylist: delayed 579 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 27 Oct 2016 18:58:46 UTC
Received: from esa5.emerson-outbound.iphmx.com
	(esa5.emerson-outbound.iphmx.com [68.232.143.91])
	by mail.openembedded.org (Postfix) with ESMTP id 693EC601F1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Oct 2016 18:58:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.31,553,1473120000"; d="scan'208,217";a="42682055"
Received: from usstlz-pinfez05.extemr.org ([144.191.128.189])
	by esa5.emerson-outbound.iphmx.com with ESMTP/TLS/AES128-SHA;
	27 Oct 2016 18:49:08 +0000
Received: from USSTLZ-PMSG008.emrsn.org (10.16.72.190) by mail.emerson.com
	(10.16.8.78) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Thu, 27 Oct 2016 18:50:38 +0000
Received: from USSTLZ-PMSG007.emrsn.org ([169.254.2.244]) by
	USSTLZ-PMSG008.emrsn.org ([169.254.3.181]) with mapi id 14.03.0224.002;
	Thu, 27 Oct 2016 18:49:08 +0000
From: <Sam.Lin@Emerson.com>
To: <openembedded-devel@lists.openembedded.org>
Thread-Topic: Question for Krogoth mongodb (3.3.0+gitX) recipe
Thread-Index: AdIwZETSdSFRtkY6Qb+nCAx21YxrCQACFt1AAAWJBoA=
Date: Thu, 27 Oct 2016 18:49:07 +0000
Message-ID: <63F070ED13CF484B8FBF261782095790B773B606@USSTLZ-PMSG007.emrsn.org>
References: <63F070ED13CF484B8FBF261782095790B773B3CF@USSTLZ-PMSG007.emrsn.org>
In-Reply-To: <63F070ED13CF484B8FBF261782095790B773B3CF@USSTLZ-PMSG007.emrsn.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.19.249.11]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Question for Krogoth mongodb (3.3.0+gitX) recipe
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
X-List-Received-Date: Thu, 27 Oct 2016 18:58:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

For Krogoth mongodb 3.3.0+gitX recipe, it only can build "mongod" (database=
 process) and "mongos" (sharding controller) components but missing "mongo"=
 database shell. Please refer to https://github.com/mongodb/mongo/blob/mast=
er/README#L9  I am curious that will mongodb recipe support "mongo" databas=
e shell in future?

Thanks,
Sam Lin

