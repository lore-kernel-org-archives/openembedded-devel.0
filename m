Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1P2qjE-0008JA-AB
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Oct 2010 21:29:40 +0200
Received: by wyb35 with SMTP id 35so5375521wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Oct 2010 12:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=TMDT68cJPjpassV98fcHPBXX0OB/hkbX/QS17v9F2Ik=;
	b=t6ReUi6jSpDYXVIBWzuRKcvWjq9cr4mPMdj6/vLF4qOHGrD7YORZZXxAYNWU7Y9nW3
	hCJfPwu6xl8JwJjNhiz+sRV1bZAU0LRNr6QvHtOUBCMmeU2lmPPLaPkAEYDGbKhEPLQV
	yefnWoTSNzztNnGUm2w8/Zv3CBfsEfW2rExsI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=vkc/rUV0KJAxEiuXG+ANufrNGfJkgP4yARhC3L5akMOYy1BkgOrbMfh/TPXihodW9+
	hYzfKGXUVr5Wp0kWNhhYitx5hUfG+utuwWqeRiRKX450YRl4IRgRqCAT4HwIarp5b7de
	sX24qcFSd13QT4Mh0gCr+gZNZ9b67DJgKp0Ig=
MIME-Version: 1.0
Received: by 10.227.32.147 with SMTP id c19mr8391000wbd.43.1286220561911; Mon,
	04 Oct 2010 12:29:21 -0700 (PDT)
Received: by 10.220.195.72 with HTTP; Mon, 4 Oct 2010 12:29:21 -0700 (PDT)
In-Reply-To: <4CAA29ED.9000501@eukrea.com>
References: <4CA97897.4020001@nedap.com> <4CA97EBC.4040406@eukrea.com>
	<4CA98CEF.3090604@nedap.com>
	<AANLkTik2_YEL-dhKLr9LuJQ78W4WXS4WvUbxDfXeJk8U@mail.gmail.com>
	<4CA99206.5060001@eukrea.com>
	<AANLkTikEpu0yxUXYZvfiRbgiFjnjc+GEAJ=-_x_Mszkp@mail.gmail.com>
	<AANLkTi=wjXOWSjoiY0FqUQKU3Y+1hxWFQcvtD7HimFiv@mail.gmail.com>
	<4CAA29ED.9000501@eukrea.com>
Date: Mon, 4 Oct 2010 12:29:21 -0700
Message-ID: <AANLkTi=mh5OKhwL8qE7ZNwqwh5abjP3=w==oDNHrRbai@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: trouble compiling udev
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
X-List-Received-Date: Mon, 04 Oct 2010 19:29:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 4, 2010 at 12:24 PM, Eric B=E9nard <eric@eukrea.com> wrote:
> Le 04/10/2010 20:34, J. L. a =E9crit :
>>
>> udev151 builds for me without this fix and I am building with gcc
>> 4.5.. Just thought I would let you know
>>
> which machine / arch / distro are you building for ?
>
> Eric
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

gumstix overo angstrom 2010.x gcc 4.5

The only reason I was asking about clarification to the fix you
mentioned was I was trying to see if it fixed a different package that
broke for me.


