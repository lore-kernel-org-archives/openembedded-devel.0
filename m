Return-Path: <ross.burton@intel.com>
Received: from mail-ot0-f180.google.com (mail-ot0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id 008C57836A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jun 2018 22:52:06 +0000 (UTC)
Received: by mail-ot0-f180.google.com with SMTP id p95-v6so5448878ota.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jun 2018 15:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=x9fFI6gu5VYUVao2DBRTabMcFM0CNJQipRY/scICNWs=;
	b=CbcXYLg3C8VEm1GxOppw6gysgDZOiTL/bOKThVuLt0YvqK77hHalox5MXpsUFoZqW9
	2aNTKKhPrAq6yB1S7BVCD5maXTVH/8FUD6rCSKkUlZsTmP0wguOnAPEeoirkW/uYaIoB
	TAQxtoTrAA1SkdQ7cNw27mN5WiipCw+BhHRxYAkRlJnREZHT3tbVPn3EzP6AS4ckUL+b
	piECWQs1aTyTqSOnJZ8DbgMlx6l5PNOHIES6YKo76IGfM5RgtDwfkcWm1vq0z52ed1du
	5A3Kw4ggB81ywFXMzGo1wiEobmK6Td47mF5cgqg+uKmFHMBkxKP77Am2CQavYtTvEVmy
	w5sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=x9fFI6gu5VYUVao2DBRTabMcFM0CNJQipRY/scICNWs=;
	b=Vs8fhSD0spiM2mZvuPvoUopz6ErNMjFzExleow1W1KM3k2axJ8K9I4VFBMJ+J5/lqg
	EUfXYlIeDL+VWUom5zBNt0p3cL3UhVVvnliyOStHRN25iBi85w69gxSFLLcOLMnIasX6
	SGSfvvs9PyCBJWBSpg5kbT0+PiEz2D8Fk9Hv509KsOJqe4K4CGAtx91O+6j1TQWQHzql
	+jtUrCfK4gmelyT1h5kpwXWtTzlx1L7GszWfpeRMIH+UtxHVERo5G0ARBhqKWoP2szmp
	V31AotTtpH0ypEP+ejPchjlhuuQxvcG5fV7rKLhgARHJ1rJhUWgHoZZcbaLlJs35WHNM
	Sx8w==
X-Gm-Message-State: APt69E3YfKNqQtRID0ovF0pw3S83h2o6oyB9h2Fi1uuqv2HybAv7qvI6
	cufEMVqpF6U6LoT2MD3vqK1WmU/nkKIfruSZsqEO+A==
X-Google-Smtp-Source: ADUXVKLB0OlgDHoUlj2V2Pds8WSXzU6jEcWlv8B6cLbV5rBd7dZ+PBd5jWg22gooa4ui0VMPzjeWL1k46D2zf79eu0g=
X-Received: by 2002:a9d:627:: with SMTP id
	36-v6mr15734484otn.168.1529621528035; 
	Thu, 21 Jun 2018 15:52:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP; Thu, 21 Jun 2018 15:51:47
	-0700 (PDT)
In-Reply-To: <CANnkhLN8jLmWN4-74EVFwyQPA8cGEsCO6ZV+inPXkk+Q-aE6vg@mail.gmail.com>
References: <CANnkhLOrKpULd6iUBOs--aJfRmNMyzY9T4MfF5T=AgNcOnBFPw@mail.gmail.com>
	<CANnkhLN8jLmWN4-74EVFwyQPA8cGEsCO6ZV+inPXkk+Q-aE6vg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 21 Jun 2018 23:51:47 +0100
Message-ID: <CAJTo0LYo6KBhpQD7WFkmP-VeeVim8hKO_Nm-+dCsKMcnmXHW5A@mail.gmail.com>
To: Henry Chang <mr.changyuheng@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Can't see my patches on lists.openembedded.org
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Jun 2018 22:52:07 -0000
Content-Type: text/plain; charset="UTF-8"

Yes, you have to subscribe, or your posts will be moderated and will
be delayed until the queue is reviewed.

Ross

On 21 June 2018 at 23:45, Henry Chang <mr.changyuheng@gmail.com> wrote:
> Hi guys,
>
> Does the mailing list server lists.openembedded.org have any delays?
> I've sent several patches to it but couldn't see any results in the
> archive. Or do I have to subscribe to the list?
>
> Regards,
>
> Henry
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

