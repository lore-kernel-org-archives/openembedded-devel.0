Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f45.google.com (mail-qa0-f45.google.com
	[209.85.216.45])
	by mail.openembedded.org (Postfix) with ESMTP id 586866E8CF
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Feb 2014 19:51:23 +0000 (UTC)
Received: by mail-qa0-f45.google.com with SMTP id ii20so6006890qab.32
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Feb 2014 11:51:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=U3997DzBe6UAPMorVLXQLBMUDrB5juJWwP4aalv4+ho=;
	b=k6hstmrkavHwmiPW7TIYPVn2QUuG3gv3HT52vOXXoNz7q2iXdgY+aA2dGp80itH2K7
	7Ha7NZPzg6q3jwl4IESzeUrMFPWoHzYKufgjq8FEkX4BDFhTEV1Qe1SJlOfPUYCucT1L
	ML1oGfEZjn2cLpz1t0r6YStLalDm7whvA6YpSWkOwrnbYx9zN4evklfAyCX2YUZGBy36
	5dFl9GU3XUfAYnUp31f/VvFtYn7Jz5QzRJcwepRCsv0LuxNceGysOLUwYrP2sqhMGuJ9
	TLI2GoaWk6i3uzFTeeKb5TMwbhe4xec68JsamJYaA/kIRmSNoVX4XRAeGM5qc5NhrabU
	eHdA==
X-Gm-Message-State: ALoCoQkN6wUg5Yv4G3SGg/ZE5z0r6SdLxfNfnx8jHS0ivaAluBaSV2WNQLivZ96vf9Vl2tiAyZ+i
X-Received: by 10.224.134.196 with SMTP id k4mr25347384qat.22.1391802683494;
	Fri, 07 Feb 2014 11:51:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Fri, 7 Feb 2014 11:51:01 -0800 (PST)
In-Reply-To: <CAFeBWL5iManz=rkRY+FZ4aK-6+KdwZRBhQnso6HiLP32yFF7Gw@mail.gmail.com>
References: <CAFeBWL5iManz=rkRY+FZ4aK-6+KdwZRBhQnso6HiLP32yFF7Gw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 7 Feb 2014 19:51:01 +0000
Message-ID: <CAJTo0LbcJjzSdUj20JbH=5ym9zhuMQUCG5j4zW3Y5j=Ucf4HyA@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: dbus-daemon-proxy repository has disappeared
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
X-List-Received-Date: Fri, 07 Feb 2014 19:51:23 -0000
Content-Type: text/plain; charset=UTF-8

On 7 February 2014 18:59, Adam Lee <adam.yh.lee@gmail.com> wrote:
> I am tracking refs/heads/dora and this morning I got a fetch failure on
> dbus-daemon-proxy (git://
> git.collabora.co.uk/git/user/alban/dbus-daemon-proxy). No available
> mirrors, so I am build blocked.

Have you tried emailing Alban at Collabora?

Ross

