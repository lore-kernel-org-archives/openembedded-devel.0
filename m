Received: from mail2.eads.net ([80.156.45.114] helo=mail.eads.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wolfgang.Hauser.external@cassidian.com>)
	id 1S4rf0-0008Lb-BN for openembedded-devel@lists.openembedded.org;
	Tue, 06 Mar 2012 11:30:26 +0100
Received: from gsx3071-vs5.mxchg.m.corp ([53.147.176.148])
	by mail.eads.net (8.13.8/8.13.8/Debian-2) with ESMTP id q26A8HXJ009263
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 6 Mar 2012 11:08:18 +0100
Received: from gsx300a.mxchg.m.corp ([10.43.212.131]) by
	gsx3071-vs5.mxchg.m.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Tue, 6 Mar 2012 11:08:19 +0100
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Tue, 6 Mar 2012 11:08:18 +0100
Message-ID: <0C757E680E33864AB113392C7E83F910BE52D2@GSX300A.mxchg.m.corp>
In-Reply-To: <20120305225422.GD2030@denix.org>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] Disable GNU Hash check ?
Thread-Index: Acz7K3i1crZXoHLFRRGV02DvA+D72gAVUxuA
References: <0C757E680E33864AB113392C7E83F910BE52CF@GSX300A.mxchg.m.corp>
	<20120305225422.GD2030@denix.org>
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@cassidian.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 06 Mar 2012 10:08:19.0720 (UTC)
	FILETIME=[0E5C8880:01CCFB81]
Subject: Re: Disable GNU Hash check ?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Mar 2012 10:30:26 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


>> INSANE_SKIP_${PN} =3D "True"

>> --=20
>> Denys

Thanks for that hint, but it is=20

INSANE_SKIP_${PN} =3D True
INSANE_SKIP_${PN}-dev =3D True
INSANE_SKIP_${PN}-dbg =3D True

That solves the problem.

Regards
Wolfgang


