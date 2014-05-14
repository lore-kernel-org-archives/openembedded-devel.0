Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f172.google.com (unknown [209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id A691C605B2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 May 2014 08:51:00 +0000 (UTC)
Received: by mail-qc0-f172.google.com with SMTP id l6so2284144qcy.31
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 May 2014 01:51:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=GvoO0ZGayy+7tx+uHDGpAi7YFwjCitKsg3Ms2HLmweo=;
	b=OS0o6yp+1LqI0nAzj8Sq4w+bqApwYLRfU3CcBK6QtCqH4LwZDC8lU9tgcmdLrqMLKm
	FfUhz1lzQuEgmBV8H9Sy50HOPHCUAaIi1eWTgZEtDUAbHyt7oZH8CYE3dsy3iPus9mto
	hLyuvDRrV1akpsfpT/27fclJVJCrbdTTG6fdyc6crW5y4gqgHLwqG5xTJTpeDT8JM4qT
	l58nJ7f1kNlQJ1ODoS5EP3/3/dInn4sNerTzJQSp/+iTy+yI3JYDBJXFZ8OBhjNgnlyn
	QvdOE2z7xvwhl5Jq6uEBFPfOMeqKqvJ7MML7lZW6vwnuA1WoHqwZLIjDTzhmUpdd5Tyq
	5Iqw==
X-Gm-Message-State: ALoCoQkdYLDop36FqrwBvzHROBiL0kWCIFrs1hAY93QMxaWE4OAfnGpkcVNvPH159JiV6/ZWFI0v
X-Received: by 10.224.160.142 with SMTP id n14mr1344622qax.17.1400057461425;
	Wed, 14 May 2014 01:51:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Wed, 14 May 2014 01:50:41 -0700 (PDT)
In-Reply-To: <CAGw0TDP6FDCfCyWjj2Akm+BfNButm5q93kGC=G8-MKCNxTuG+A@mail.gmail.com>
References: <CAGw0TDP6FDCfCyWjj2Akm+BfNButm5q93kGC=G8-MKCNxTuG+A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 14 May 2014 09:50:41 +0100
Message-ID: <CAJTo0LasCMwBLQVqgVVwdpLb4ScpKXW0dAPOLKKLcYjxrZeSoA@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: freetype build error 'libfreetype.la: No such file or directory'
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
X-List-Received-Date: Wed, 14 May 2014 08:51:09 -0000
Content-Type: text/plain; charset=UTF-8

On 14 May 2014 05:57, Charles Oram <charles@oram.co.nz> wrote:
> |/bin/grep:
> /home/charles/fsl-community-bsp/build/tmp/sysroots/cubox-i/usr/lib/
> libfreetype.la: No such file or directory

Saul saw this once but I never managed to replicate it.  Doing a clean
and rebuild will probably fix it, although that is a work around and
not a solution...

Ross

