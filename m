Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sankar.m@hardcube.in>) id 1U6aru-00073p-LH
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Feb 2013 07:03:27 +0100
Received: by mail-we0-f175.google.com with SMTP id x8so3501667wey.34
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2013 21:47:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-received:x-originating-ip:in-reply-to:references
	:date:message-id:subject:from:to:content-type:x-gm-message-state;
	bh=0GVTCBEOiiW45yrKsw8IbEessniPx5sipvVDd+7K2iI=;
	b=P2MW1xYNjOltZGCWQu08IrhRKmCXyZh9yPBsRw66642yOTl8jkUX/mzkisT0ChuYFv
	u8Hf6tJ3yTrrZ13/3U0r/1BWcM850VCwdex4XHQiEzMcF4RdzGa3cfAFVObRnT6AAusi
	LIKDS336/0sJGsb5yCnL4aGbfT9EON1gSR8hy6pse5kiDv9xNzJCKz9R4nkhAMoxekvK
	Q9ua2UEgLNOFHvbj6ZfKSGuZ5juPsAFAmQ/kPvXG1abLcZ2dMcSImcGguS6O/EL2tFyZ
	sOvlhJiRAhntyzoKoRD+Ogh6KowgvcXOSjKvvwjC+o9Y1FhcLSmR7C/pBtABfMziovo+
	VbWQ==
MIME-Version: 1.0
X-Received: by 10.194.80.2 with SMTP id n2mr8336990wjx.14.1360993641953; Fri,
	15 Feb 2013 21:47:21 -0800 (PST)
Received: by 10.216.32.133 with HTTP; Fri, 15 Feb 2013 21:47:21 -0800 (PST)
X-Originating-IP: [203.193.158.21]
In-Reply-To: <CAJTo0LZbQ2YSR5+1vSqChMDq85Rnj+WgMr=U4=rdrePBsp27KA@mail.gmail.com>
References: <CAKSKmM3AKfssEKaJ6ndb5v9On73Yi6WW9b99h6biHtD=8xS6Aw@mail.gmail.com>
	<511CAFF3.3090004@communistcode.co.uk>
	<CAKSKmM3vHzj_-Jh1MP1SZxxsCYe212NdnWApHvmn6CVJPXOMsA@mail.gmail.com>
	<511CB7DD.4080407@communistcode.co.uk>
	<CAKSKmM3keR3GKfvT5_VFvL101RBjbwfS4=ugV=yodWfBRfzs4w@mail.gmail.com>
	<CAJTo0LbBSzhFyghuTRrbeb5bpL4oB7DO=2i3GMc_CTtpxTzq2g@mail.gmail.com>
	<CAKSKmM2NNdci6kCtaxnWDgApkFerkTDYFGy78-XddG9N8xqBGw@mail.gmail.com>
	<CAJTo0LaESjBTOXzxQzQm5KxkQqOi8HnKgJxxjr99mNWTbbeVog@mail.gmail.com>
	<CAKSKmM2bC1C65ca2RZcKvz3yTEM_9+yHFq95yMD+hJPWpYziCA@mail.gmail.com>
	<CAJTo0LayOQb60HB--SWiWBYau=ECryZx7Kn_QD21-G8kEMZiog@mail.gmail.com>
	<511E200D.3000907@communistcode.co.uk>
	<CAJTo0LbUmwwPs2eRvOBSCzep0OHx3KRn+XPO5xWSpcgbuN0RjQ@mail.gmail.com>
	<CAKSKmM3siHyHoNkqE02JQZcLBkkHKQyfpeTG2W1zfi+BVs0Tmg@mail.gmail.com>
	<CAJTo0LZbQ2YSR5+1vSqChMDq85Rnj+WgMr=U4=rdrePBsp27KA@mail.gmail.com>
Date: Sat, 16 Feb 2013 11:17:21 +0530
Message-ID: <CAKSKmM061jii+YZzn-uBFuMoGW8eeR0y6OCoDkNxDwpTSr=gDA@mail.gmail.com>
From: Sankar H Malarmani <sankar.m@hardcube.in>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQnxRFq94zyxnPyRU/rzNX3q2m2QQ6QjMOSF9XXIX/vl0dEznokdyirhghGwIeHYXPT1uwNZ
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: gtk errors in openembedded classis build
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
X-List-Received-Date: Sat, 16 Feb 2013 06:03:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

I just followed the instructions given in that toradex website.. Its what
giving me the following error..

/home/hc/oe-core/build/../stuff/openembedded-core/meta/recipes-connectivity/wpa-supplicant/
wpa-supplicant_2.0.bb inherits systemd but doesn't set SYSTEMD_PACKAGES

What I'm doing wrong here.. What should I do to overcome this.. ?

On Fri, Feb 15, 2013 at 8:42 PM, Burton, Ross <ross.burton@intel.com> wrote:

> On 15 February 2013 14:59, Sankar H Malarmani <sankar.m@hardcube.in>
> wrote:
> > As I mentioned earlier I'm new this openembedded stuffs.. So, can you
> > please guide me to build an image without hitting on any errors. Steps I
> > should follow to get it..
> > Your help is much appreciated..
>
> Following the instructions on
>
> http://developer.toradex.com/software-resources/arm-family/linux/source-code/linux-%28colibri-t20%29-openembedded
> will go a long way to helping - at the moment you're building the
> wrong pieces.
>
> Ross
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Thanks & Regards
*Sankar*
*Junior Programmer
*
*
*
*HardCube IT Consultancy Private Limited*
*II Floor , STPI - Software Technology Parks of India*
*5 Rajiv Gandhi Salai*
*Taramani, Chennai 600 113*
*Ph: 91 - 44 - 3918 0857*
*info@hardcube.in*
*http://www.hardcube.in*
**************
*"The contents of this E-mail (including the contents of the enclosure/(s)
or attachment/(s) if any) are privileged and confidential material of
HardCube IT Consultancy Private Limited, and should not be disclosed to,
used by or copied in any manner by anyone other than the intended
addressee/(s).If this E-mail (including the enclosure/(s) or attachment/(s)
if any) has been received in error, please advice the sender immediately
and delete it from your system. The views expressed in this E-mail message
(including the enclosure/(s) or attachment/(s) if any) are those of the
individual sender, except where the sender expressly, and with authority,
states them to be the views of "HardCube"."*
***************

