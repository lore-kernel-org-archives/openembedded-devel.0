Return-Path: <ticotimo@gmail.com>
X-Greylist: delayed 365 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 10 May 2014 17:39:27 UTC
Received: from mail-la0-f50.google.com (unknown [209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 49D2E60703
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 May 2014 17:39:27 +0000 (UTC)
Received: by mail-la0-f50.google.com with SMTP id b8so776188lan.37
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 May 2014 10:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Y8heeVllC8jDpiBxUT3LXZyiZ+ztsr+7B5rINyEdjYw=;
	b=HloyAz6XPWbO6thmjiwwbC2VHvQofqvhbyYjSxn5b2t2UoBrAHqz/Dx4j2cyuq9i7G
	pleHWavoDDF5+ZLe3CQPjmQ/salmQeshsLwzmyGOBCM3dN+cTW3GSjOLED8izf3G+Nbr
	/bD//LeaXHErm1DgI7ZBSiUnGVM34Prt6Y1ExuKXifqeSAXKKFLwvxta2cmvdIk1C4Yl
	ykTM1N1p4qlGicHz2Zutk115rvWaYuwSXhXfoElaPLGoVpV1bdOpHUqx57NZF8RfNEab
	c9bUM2/PFhCJET2MzKxNTdb21jcyfFzpfEvO6Qif05r14mU9OIUQBfk51WyefS3xMmeu
	FByg==
MIME-Version: 1.0
X-Received: by 10.152.8.7 with SMTP id n7mr4880578laa.22.1399743203191; Sat,
	10 May 2014 10:33:23 -0700 (PDT)
Received: by 10.114.216.4 with HTTP; Sat, 10 May 2014 10:33:23 -0700 (PDT)
In-Reply-To: <CAMKF1so8ws==4eFv5C7n_OR_WeSYcWSK86nXuYj5yrKu+-bfXg@mail.gmail.com>
References: <1399484702-22433-1-git-send-email-ticotimo@gmail.com>
	<CAMKF1so8ws==4eFv5C7n_OR_WeSYcWSK86nXuYj5yrKu+-bfXg@mail.gmail.com>
Date: Sat, 10 May 2014 10:33:23 -0700
Message-ID: <CANx9H-Dx_s7A7pWNcVU3e+vHrV5pLWCgBC3Xc_tZpi-k-WMG9w@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-multimedia][WIP][PATCH v2] fluidsynth: upgrade to 1.1.6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 10 May 2014 17:39:30 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, May 10, 2014 at 10:15 AM, Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, May 7, 2014 at 10:45 AM, Tim Orling <ticotimo@gmail.com> wrote:
> > -LIC_FILES_CHKSUM = "file://COPYING;md5=dda26baa823649da9a68947707650272"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=e198e9aac94943d0ec29a7dae8c29416"
>
> what changed here ?
> --


Just the address for FSF:

diff 1.1.1-r0/fluidsynth-1.1.1/COPYING 1.1.6-r0/fluidsynth-1.1.6/COPYING

6c6

<                     59 Temple Place, Suite 330, Boston, MA  02111-1307
USA

---

>  51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA

467,468c467,468

<     License along with this library; if not, write to the Free

<     Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307
USA

---

>     License along with this library; if not, write to the Free Software
>     Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301,
USA

> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

