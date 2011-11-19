Received: from smtpfb1-g21.free.fr ([212.27.42.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RRg7w-0007BP-4j
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Nov 2011 09:18:20 +0100
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by smtpfb1-g21.free.fr (Postfix) with ESMTP id 45A9377C76F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Nov 2011 09:05:59 +0100 (CET)
Received: from [192.168.2.8] (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 9314BA6434
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Nov 2011 09:05:54 +0100 (CET)
Message-ID: <4EC76361.9070604@eukrea.com>
Date: Sat, 19 Nov 2011 09:05:53 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAFU7RzMFc2jtHKRAHQYBykpBTAVhpEKh+01yKUZFXr6Et+LDFA@mail.gmail.com>
In-Reply-To: <CAFU7RzMFc2jtHKRAHQYBykpBTAVhpEKh+01yKUZFXr6Et+LDFA@mail.gmail.com>
Subject: Re: dm3730 question
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
X-List-Received-Date: Sat, 19 Nov 2011 08:18:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Raffaele,

Le 19/11/2011 08:28, Raffaele Recalcati a =E9crit :
> At the moment I have a arago image running am37xx (without dsp) on my
> desk with 2.6.37.
> Can anybody point me the right branch for OE in order to move also
> with dm3730 to 2.6.37 kernel?
> The MACHINE can be either beagle-xm or dm3730-evm.
> The confusion is created by the MACHINE=3Dbeagleboard that I don't know
> if support dm3730 cpu.

current oe-core builds a 3.0.x kernel which runs fine on beagleboard.
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-texasinstrumen=
ts/tree/recipes-kernel/linux/linux_3.0.bb

Yo can get it easily with
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/setup-scripts/

Eric


