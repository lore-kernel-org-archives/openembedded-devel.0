Received: from mail-tx2.bigfish.com ([65.55.88.10]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TJPpC-0006KI-GD
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Oct 2012 16:21:22 +0200
Received: from mail263-tx2-R.bigfish.com (10.9.14.242) by
	TX2EHSOBE010.bigfish.com (10.9.40.30) with Microsoft SMTP Server id
	14.1.225.23; Wed, 3 Oct 2012 14:08:22 +0000
Received: from mail263-tx2 (localhost [127.0.0.1])	by
	mail263-tx2-R.bigfish.com (Postfix) with ESMTP id 104E2E8008C;
	Wed,  3 Oct 2012 14:08:22 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202h1d1ah1d2ahzz8275bhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2h1288h12a5h12a9h12bdh137ah13b6h1441hbe9i1155h)
Received: from mail263-tx2 (localhost.localdomain [127.0.0.1]) by mail263-tx2
	(MessageSwitch) id 1349273298913037_11407;
	Wed,  3 Oct 2012 14:08:18 +0000 (UTC)
Received: from TX2EHSMHS033.bigfish.com (unknown [10.9.14.253])	by
	mail263-tx2.bigfish.com (Postfix) with ESMTP id D3DBF700049;
	Wed,  3 Oct 2012 14:08:18 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS033.bigfish.com
	(10.9.99.133) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 3 Oct 2012 14:08:16 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.124]) by
	039-SN1MMR1-004.039d.mgd.msft.net ([::1]) with mapi id 14.02.0309.003;
	Wed, 3 Oct 2012 09:08:16 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-webserver][PATCH 0/6] Add meta-webserver
Thread-Index: AQHNoXCI+KGHC5xNIkuWwpiUJTdGBw==
Date: Wed, 3 Oct 2012 14:08:16 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A6CBF8D@039-SN1MPN1-001.039d.mgd.msft.net>
References: <cover.1349107616.git.paul.eggleton@linux.intel.com>
	<1396458.ob1fernpZs@helios>
	<74B58CA1-2332-42D6-9652-4226D9484259@dominion.thruhere.net>
	<5056040.jAUIlqh764@helios>
In-Reply-To: <5056040.jAUIlqh764@helios>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-webserver][PATCH 0/6] Add meta-webserver
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
X-List-Received-Date: Wed, 03 Oct 2012 14:21:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <18999A1B8C960B4EAC8BB41485F7A3B1@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 3, 2012 at 8:43 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> The answer is no, it doesn't.
>
> I guess on reflection we probably ought to be consistent here though - fo=
r
> better or worse, this is not what has been done when pulling in recipes f=
rom
> OE-Classic for the rest of meta-openembedded. The commit message does alr=
eady
> list the changes from the original, and I'll concede that having just one
> revision doesn't give a huge amount in the way of insight on previous ori=
gin;
> ultimately as you say, OE-Classic is still there as a reference for that.
>
> OK, I've squashed those commits out on the branch. Would it be worth me
> posting a v2 after all these changes?

Actually, this is one really annoying thing about OE. When people
rename the file 'git blame' comes worthless. Is there a way around
this?

-M=



