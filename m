Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RUjzt-000056-Hw
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Nov 2011 20:02:41 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 27 Nov 2011 10:56:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="80417453"
Received: from unknown (HELO helios.localnet) ([10.252.121.183])
	by orsmga002.jf.intel.com with ESMTP; 27 Nov 2011 10:56:03 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 27 Nov 2011 18:56:01 +0000
Message-ID: <1414964.lPpRFmgCOe@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-13-generic-pae; KDE/4.7.3; i686; ; )
In-Reply-To: <1322419119.7998.43.camel@mattotaupa>
References: <CA+M6bX=PYZ+2vb32ZmT3SirqHdKpCtD90QqtHhQiWSp38f1kVA@mail.gmail.com>
	<15202278.8Gdc2a6et6@helios> <1322419119.7998.43.camel@mattotaupa>
MIME-Version: 1.0
Subject: Re: Documentation problems
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
X-List-Received-Date: Sun, 27 Nov 2011 19:02:41 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Sunday 27 November 2011 19:38:39 Paul Menzel wrote:
> Only Koen brought up the idea of the pull model. By itself, ikiwiki a=
lso
> allows Web edits [1].

Yes but what benefit do we get by changing the system? Only that the ba=
ckend=20
changes to git? Given that MediaWiki is familiar to many (thanks to Wik=
ipedia)=20
I would be hesitant to replace it with anything less widely understood.=


> Additionally, you have not addressed the point that reality shows, th=
at
> not a lot of people write documentation and use it. The best way to
> =E2=80=9Cenforce=E2=80=9D this is to add documentation with the corre=
sponding change.

I'm not sure I understand what you mean here. If you're suggesting that=
 we=20
will be able to force people to write changes for the documentation tog=
ether=20
with their changes to the code, I think there are two problems with thi=
s:=20
  (1) it assumes that we already have complete documentation for the cu=
rrent=20
state of the code;
  (2) given that writing meaningful commit messages is a challenge for =
many=20
contributors, you're going to have a very difficult time getting people=
 to write=20
documentation for their changes as well.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre


