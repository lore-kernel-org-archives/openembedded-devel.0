Received: from jak.nl ([65.204.18.188]) by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <arjan@jak.nl>) id 1OW2ix-0005WQ-0X
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Jul 2010 09:37:47 +0200
Received: (qmail 73385 invoked by uid 89); 6 Jul 2010 07:32:57 -0000
Received: from jak.nl (HELO ?128.63.129.1?) (65.204.18.188)
	by jak.nl with SMTP; 6 Jul 2010 07:32:57 -0000
Message-ID: <4C32DC17.5040804@jak.nl>
Date: Tue, 06 Jul 2010 09:32:39 +0200
From: Arjan <arjan@jak.nl>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.9.1.10) Gecko/20100512 Thunderbird/3.0.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <59209027-3666-426D-9085-D9F6647B07D5@keylevel.com>	<AANLkTin42ODhDbRm0CBbFVT5DtFJVCyTqfg1f0VakNEb@mail.gmail.com>
	<411868D6-A821-4909-9F5B-6323EE7F9802@keylevel.com>
In-Reply-To: <411868D6-A821-4909-9F5B-6323EE7F9802@keylevel.com>
X-SA-Exim-Connect-IP: 65.204.18.188
X-SA-Exim-Mail-From: arjan@jak.nl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: 'Generic' x86 build
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
X-List-Received-Date: Tue, 06 Jul 2010 07:37:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 3-7-2010 1:18, Chris Tapp wrote:
>> how about MACHINE=i686-generic or MACHINE=i586-generic
>> distro could be angstrom or minimal.
>
> Thanks - Not sure how I managed to miss that one!
>
> Anyway, I've tried i586-generic / minimal for console-image.
>
> - The inittab file included in the rootfs isn't valid for busybox;
> - The 'swapper' process is using 100% cpu after the system has booted 
> and it's doing nothing.
>
> Does anyone else have this, or is it just me?
>

Just checked my build of _x11-image_ MACHINE=i686-generic DISTRO=angstrom
I don't see this happening.

Angstrom 2010.7-test-20100624
Built from branch: org.openembedded.dev
Revision: .
Busybox: v1.13.2


