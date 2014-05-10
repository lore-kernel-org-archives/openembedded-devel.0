Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f181.google.com (unknown [209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 95EEF60173
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 May 2014 18:38:27 +0000 (UTC)
Received: by mail-ie0-f181.google.com with SMTP id y20so5431329ier.40
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 May 2014 11:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=vYl5oCC4z5mjNxSVHGZzrJ6AUlNSB3V/Kmv24R4jpPc=;
	b=jopT64j905hxuSB0zagU6sHCOdynGezGLDR3h1u95Sz0eGQm0V4aS1DBT7V9If8R2h
	8nFw8FlVtYUKxF7ptRM1QVTpV6K+pzRfgL3d2FUoRUK0+8GG68uQQY6a8niQ5zqI3Gsu
	dqg9BTgdtR8+TPyEiorkKrb2KVUhaVSxrQcZe7paazpqcOIrkJkK/iaO96+xf/ECs4fF
	vojKKMjM4uYPiNuDCKxEJIXNnc6U76bJrnBIBOX8xG0cA2LfVrJSMDytuVZzQyouNzpO
	BCe5Un3SujwW+JRav6s8dHqhJ22ZYHjgq17mxVV/BqrQl/I+RRU3F7DaJwloCyE0dw5V
	9nQQ==
X-Received: by 10.50.43.136 with SMTP id w8mr24450360igl.20.1399747108201;
	Sat, 10 May 2014 11:38:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.79.133 with HTTP; Sat, 10 May 2014 11:37:58 -0700 (PDT)
In-Reply-To: <CANx9H-Dx_s7A7pWNcVU3e+vHrV5pLWCgBC3Xc_tZpi-k-WMG9w@mail.gmail.com>
References: <1399484702-22433-1-git-send-email-ticotimo@gmail.com>
	<CAMKF1so8ws==4eFv5C7n_OR_WeSYcWSK86nXuYj5yrKu+-bfXg@mail.gmail.com>
	<CANx9H-Dx_s7A7pWNcVU3e+vHrV5pLWCgBC3Xc_tZpi-k-WMG9w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 10 May 2014 11:37:58 -0700
Message-ID: <CAMKF1sqZMmv0zH3SmoA7qmDe4RKNZbRm4y5RqSqOvZXm_6wgYA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Sat, 10 May 2014 18:38:29 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, May 10, 2014 at 10:33 AM, Tim Orling <ticotimo@gmail.com> wrote:
> Just the address for FSF:

OK it would be good to have that recorded in commit message

