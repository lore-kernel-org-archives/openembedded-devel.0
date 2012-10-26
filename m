Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TRm6M-0001IF-CB
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Oct 2012 17:45:39 +0200
Received: from mail-ie0-f197.google.com ([209.85.223.197])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 26 Oct 2012 08:32:06 -0700
Received: by mail-ie0-f197.google.com with SMTP id 9so8022008iec.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2012 08:32:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=1RYp43M4iRFTz1z/BcmUzi9sPQvp0SFiuFSXsPi6BDQ=;
	b=JCs1PkFDyqvo+9x4Z7SiIp4MGF+7jA4WgSnjkJAoxFviOEzD+BPD56N/f92CNSmIt6
	zTOF19zncKh6IdYPegAU/ZfCnzuROfxrjlhBgfPWhaeKn2pPh0YFxUOUIwj5LqC6DjCO
	gpqM61p009NXWnUNSuGh8i/fQJ8Xk4dh02/B+fm0I1LqzITCZT2wKuwFnbCfi1/+pRL0
	4B139UnwZZFZAfNaeApUkaIj40/LyNwUE87ivdsuoJ/9nM1oJ/vie6bYcgFCnrhYmKcm
	X7oOyrwXnST7dwmV91H2CQU/h+fG4DyO6QqVBzOlB/gRs44hX7QoHOVPuvvWIomvE+4y
	ptpw==
Received: by 10.182.117.74 with SMTP id kc10mr18651276obb.63.1351265525122;
	Fri, 26 Oct 2012 08:32:05 -0700 (PDT)
Received: by 10.182.117.74 with SMTP id kc10mr18651269obb.63.1351265525013;
	Fri, 26 Oct 2012 08:32:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.46.70 with HTTP; Fri, 26 Oct 2012 08:31:44 -0700 (PDT)
In-Reply-To: <k6e9ht$ra9$1@ger.gmane.org>
References: <CAJTo0LYm7bwU0fNYcD8wQ3unJm_ShoW-ej5tZ3FeeogEztJGnQ@mail.gmail.com>
	<k6e9ht$ra9$1@ger.gmane.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 Oct 2012 16:31:44 +0100
Message-ID: <CAJTo0Lbkjcr_Yy=CSkH+fHm5K9KpCKF4E9r8jy0XExATmRZqOg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQns1cWvQH3ZD2RTDihff+/k6EugLfQ/2SpJco2gfRj8BQVieKKE5XWnNGFNN0ORicacaYgaxbeqY2kJiau2O/11Pp7ujw0eGZRTt0YlHWpLqRfjscKzF56MUj/yIuWwzak7o4WgTFPA+lQq0e5CFLwy4oCDZHg8LW/fcILgDx099pLxT6ArEfSlLMtxFq73CHK3IBaZ
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Danny stable release branch
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
X-List-Received-Date: Fri, 26 Oct 2012 15:45:39 -0000
Content-Type: text/plain; charset=UTF-8

On 26 October 2012 16:17, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> Expect to see a ross/danny-next series in the poky-contrib repository
>> fairly soon where I'll be staging the commits.
>
> Who's the maintainer for the oe-core danny branch?

Shush, don't tell anyone, but poky-contrib:ross/danny-next would
actually be a clone of oe-core. </whisper>  Staging a branch for
oe-core using poky commits would be counter-productive.

I'm handling the stable releases of oe-core 1.3.x, not Poky 8.x.  Poky
point releases are a natural consequence of the oe-core point
releases, but not the goal.

Some how the existence of openembedded-core-contrib slipped my mind
when I wrote this first mail.  Expect a ross/danny-next to appear
instead there once I have push access.

Ross


