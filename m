Received: from mail-wi0-f179.google.com ([209.85.212.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sankar.m@hardcube.in>) id 1U7gjM-0006De-8h
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Feb 2013 07:31:11 +0100
Received: by mail-wi0-f179.google.com with SMTP id ez12so4373379wid.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Feb 2013 22:14:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-received:x-originating-ip:in-reply-to:references
	:date:message-id:subject:from:to:content-type:x-gm-message-state;
	bh=2pjbTgmLSSKsCjKEspwAsTm+Q5v6Syk4/lbBfUqWYow=;
	b=V5MKs38bK//NiaZu17ahw6GtfUCVe/ZtuRsp1X3mcgvEwpyXHYDuR1i4i3mgw86XtX
	8y/NxLNd9uKvyej+VcFdTPNu9cOllQLrmKPp4bESKWuBSYlBaj0chH4WgTTjYtkFc5VB
	F75Zosnpi9/l19k4U+mhxcCVyFd3yEK7voviLAGYWMGE212He2hTS7dfRC326tKflxg+
	hxrsOJiSSwyfYZ0spppysUs8dYr3rf2f1DOY/ATY3yX6PGfiIRb68zdtBvZ03J5iDh6e
	kYCeYuT9j05CfIdsniAvfKXObHID1cpfXNYwwE4TVvAnqb+ChLa8ll1xv4b/EhmjXIBW
	evmQ==
MIME-Version: 1.0
X-Received: by 10.180.93.168 with SMTP id cv8mr22983335wib.5.1361254499675;
	Mon, 18 Feb 2013 22:14:59 -0800 (PST)
Received: by 10.216.32.133 with HTTP; Mon, 18 Feb 2013 22:14:59 -0800 (PST)
X-Originating-IP: [203.193.158.21]
In-Reply-To: <CAJTo0LZmEoxWrjBKsHAh1iOsT9_+nWyK0na9WYEngRvjAB199w@mail.gmail.com>
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
	<CAKSKmM061jii+YZzn-uBFuMoGW8eeR0y6OCoDkNxDwpTSr=gDA@mail.gmail.com>
	<CAJTo0LZmEoxWrjBKsHAh1iOsT9_+nWyK0na9WYEngRvjAB199w@mail.gmail.com>
Date: Tue, 19 Feb 2013 11:44:59 +0530
Message-ID: <CAKSKmM0KRgsyewoQEcvArS+MDQDpAbUbUw4iMvX-AEMfPJ7-yA@mail.gmail.com>
From: Sankar H Malarmani <sankar.m@hardcube.in>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQkdEU8FL3M+cw+PL3Gb0Fhe65MCSHewJ0aQGQD5BpLPewHxSM8jLAUbsxVwogcqvCoLUksG
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
X-List-Received-Date: Tue, 19 Feb 2013 06:31:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I need to run my wxwidget application on the colibri module with the linux
image built using openembedded. For that I need wxwidgets library in the
colibri module.
Is it possible ?? If so, how can I do it ??

Please give your suggestions..
Thanks in advance

On Sat, Feb 16, 2013 at 3:31 PM, Burton, Ross <ross.burton@intel.com> wrote:

> On 16 February 2013 05:47, Sankar H Malarmani <sankar.m@hardcube.in>
> wrote:
> > I just followed the instructions given in that toradex website.. Its what
> > giving me the following error..
> >
> >
> /home/hc/oe-core/build/../stuff/openembedded-core/meta/recipes-connectivity/wpa-supplicant/
> > wpa-supplicant_2.0.bb inherits systemd but doesn't set SYSTEMD_PACKAGES
> >
> > What I'm doing wrong here.. What should I do to overcome this.. ?
>
> You're not using the oe-core revision specified on the web site.  You
> need to checkout a specific revision, and not use oe-core master.
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

