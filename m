Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id BC62773DF0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 20:45:31 +0000 (UTC)
Received: by igfj19 with SMTP id j19so3614006igf.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 13:45:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=7JMsEdUPfhsbVToIo6bH58o2WOr8JJlA/FCYqRm9of4=;
	b=NcRyI9gweWoUCTe+wO4SgoD/UA/djUWd5yALHro7mBZMwTgvqKznRR863WVeGwc5HQ
	6tYhkjduHrGO9LT3/j3cJxKvYqYwhl18DWOqjLnWUrQtEi+zzcCehbbExU2/THfHvP8g
	5WwjIOJoEfszmBX6WBaQbxlYaZyalq5JnUhdVa5OlDrjAr6kBnpriZBmbYhHt+081r4m
	LWfw9UQxcnDUagwX6Hpsa+TUXstwpYFuJhWyeav5AEFU/3xGb4Z34tBpEEOPkP8bXDzU
	J9clJGqYLQpwPLKEHhbhLtISpGrc8HFxapLDBp5ddRgffAXXlm0Besn1kbzXl59SjEBv
	UW+A==
X-Gm-Message-State: ALoCoQlSaHU053YWHkVVC67+I2/HMiG6Or1scRVWYGOrW8mHB6b+dcOFWe2DnhwGTZA8WeIIAo22
X-Received: by 10.50.32.97 with SMTP id h1mr347igi.29.1440103531479;
	Thu, 20 Aug 2015 13:45:31 -0700 (PDT)
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com.
	[209.85.223.182])
	by smtp.gmail.com with ESMTPSA id qf2sm5229igb.20.2015.08.20.13.45.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Aug 2015 13:45:30 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iods203 with SMTP id s203so60401621iod.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 13:45:29 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.130.153 with SMTP id m25mr4383031ioi.192.1440103529645; 
	Thu, 20 Aug 2015 13:45:29 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Thu, 20 Aug 2015 13:45:29 -0700 (PDT)
In-Reply-To: <1440065452-8807-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1440065452-8807-1-git-send-email-ricardo.ribalda@gmail.com>
Date: Thu, 20 Aug 2015 17:45:29 -0300
Message-ID: <CAP9ODKofE+KAwAMSMbZUsNOriNE-K9-j9rVX+7zJos45Z_RMzA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Nathan Lynch <Nathan_Lynch@mentor.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH v6] Opencv: Add OpenCV 3.0
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
X-List-Received-Date: Thu, 20 Aug 2015 20:45:31 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 20, 2015 at 7:10 AM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> -Support for new PACKAGECONFIGS
> -Merge with opencv-samples
>
> Since it is not backward compatible with 2.x and cannot be installed in
> parallel it has a DEFAULT_PREFERENCE of -1.
>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

