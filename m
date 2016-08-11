Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id E568777241
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 12:51:05 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id o80so14035067wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 05:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=Nvau+vYtU+7jh0ZasHnX9pcxo7jKX+H8MEqwDsyyi+k=;
	b=yZ6BemQM3DDUkqb57Q6ViKuXFeZwX9IFd8D9KMCH78Svg2hPFLQjIriwFYyf/ctJrn
	XM1SRYcgLmdZu+4cWQW3xNmRHxbQ98TEuDWyfFVTPWJQTcdypj0AUyhNLO+cUKzoSTG7
	NPz2NGuwqY1xtQdKkw4km178oRfKJD6K4lstt9bCm7PWhx5uy3iWucbcpg+EjKr9xIfP
	9b0BHOvtS0RFAqkOXb1tsZvZ27+b895F+wpnygJfmaKCoNHYfILfdVokIspOGisT1+Yp
	D9G4wZM1Qo1H5DhI5fEcRl4h1MGS0IQzWicDxeGACquWPsPwZhoHWKDPcCUsIP0Z6cP4
	egcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=Nvau+vYtU+7jh0ZasHnX9pcxo7jKX+H8MEqwDsyyi+k=;
	b=AmUUBHkJOvOdRricIs2Lv21HFMSyodSHBWmWaIJj7YmxBoho8OKorLFwa4m5gjY+it
	5jh4eOUbVeQLx2RLTTpLV17QeJ9wLcq8x09EPNCi7mFUPXIsBqfT30gJ5X49ZNqZJaQa
	lJP5UXTThMN74ZeLctyc2B8wYqxgsggsYC5I1pAFn7BQzmCAPDlHrux/ZdFa0dHnObqp
	P09w+GrusZay31ir64gErnCiXNvhiJ+aseXfwCNIqmpTAxmfpUyYLyxSNL/tz++OFXAP
	I3fskEgly5JQNEdBh6khMzXkWzVbkQuSfmd4tAS8v/dLCEpw8sDLsnqFU1O3ffvUE58O
	0JuA==
X-Gm-Message-State: AEkoouuqZT/XmJmVYRPiv0Mkj9OWTGysS9lK3F7xM9r0GFS7DrSgLGRVRa58ENXXz/ioVv+p3Vm77Aaj6r7bGA==
X-Received: by 10.28.207.132 with SMTP id f126mr8659758wmg.40.1470919865405;
	Thu, 11 Aug 2016 05:51:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.139.148 with HTTP; Thu, 11 Aug 2016 05:50:44 -0700 (PDT)
In-Reply-To: <20160811114602.moixzrw6p73hm2lo@jama>
References: <1470914045-8059-1-git-send-email-ricardo.ribalda@gmail.com>
	<20160811114602.moixzrw6p73hm2lo@jama>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Thu, 11 Aug 2016 14:50:44 +0200
Message-ID: <CAPybu_0MYrOyBT=fDcNCqZTYKZMq0fbZ_LVKEaEv-4HCxSY0GQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] glog: Update to version 0.3.4
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
X-List-Received-Date: Thu, 11 Aug 2016 12:51:07 -0000
Content-Type: text/plain; charset=UTF-8

Hi Martin

On Thu, Aug 11, 2016 at 1:46 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
 +        "
>
> Please see show we normally indent multiline variables (4 spaces,
> closing quote as first character on separate line.
>
> I'll update this for now, but next time please follow this.

Do you have a readme with this? Or something like checkpatch from the kernel?

Thanks!

