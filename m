Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 267BB731D6
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jan 2016 19:15:36 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id o67so475776261iof.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jan 2016 11:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=PCt/V/MVZjT3r+9QttU5YMLb1KmCOVMFqtGVfVMMEk4=;
	b=Czafzj+4Xqp5ltsZMy16XkFBiRemI380o8BFddgG40YkUzeExlbcC0ldmr0cRgAoQN
	FcjBC0FumCrJktAKWiNjEMurvZzTDWDjj2YlZ18FRL6/NBCXcD+9n+t5LFh4KhWMxl0o
	vrRd85cnevlEZtW3uNnhfYK0LY45kc3qkyaDE6ywcwhL3i0XshrDXkjb+gY/V3hDaHOS
	Y86gljsmkhqjp4KDzct+kGh8p40lCrsHlcM8QNg9xbouRclOJy/Z/2ileggwAjYQAtVY
	3i1th10kG819ngptwZsKEvUYQDuVzyDN7071EmXMiajHxBpIkKdX0YS/HF+rJ2FNWdym
	qBeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mentor-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=PCt/V/MVZjT3r+9QttU5YMLb1KmCOVMFqtGVfVMMEk4=;
	b=PhSm5lDl0QgwlNtXeRCgIPqpaupzALpxepiacJ9rws9vVN+UUyHQrWskvno0ApeVAe
	Q3YqDkbUa4SFHuGa1ui2G7hJgZLWP1sduG68ToielEwtog5Nn2Mmx9D8Ho1gCWCJgIrf
	sa5pqdL/kwpBp9o/qaV+GclqhdD5MTU3bDlW6OEl/oZd/CxVovSugWm5feVraR/w10ah
	zxs51grQVop1ua8wVWe9pSJh9Og8v0zCP4ssrNansIX04rD6I+eTx1biaXcjQ7WVAFAQ
	FFE9uDxlSiBtH+yiJ0VLz4HVtU/HTxgvn77enwF5twAVCUSaPjtOts4iEjX3rtNQl9IU
	+Lbw==
X-Received: by 10.107.134.78 with SMTP id i75mr84868677iod.74.1452021336836;
	Tue, 05 Jan 2016 11:15:36 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.104.194 with HTTP; Tue, 5 Jan 2016 11:15:17 -0800 (PST)
In-Reply-To: <1449682880-21963-2-git-send-email-kergoth@gmail.com>
References: <1449682880-21963-1-git-send-email-kergoth@gmail.com>
	<1449682880-21963-2-git-send-email-kergoth@gmail.com>
From: Christopher Larson <chris_larson@mentor.com>
Date: Tue, 5 Jan 2016 12:15:17 -0700
X-Google-Sender-Auth: RiHn3s7W_UL7W_EJl28ovPaCbI4
Message-ID: <CABcZANnyzaeCgL7Ljzs82gsd_V2-SNoL5L2DZ3NeCZP41KMVPA@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCHv2][RESEND 2/3] lowpan-tools: add missing flex/bison deps
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
X-List-Received-Date: Tue, 05 Jan 2016 19:15:36 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 9, 2015 at 10:41 AM, Christopher Larson <kergoth@gmail.com>
wrote:

> From: Christopher Larson <chris_larson@mentor.com>
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>

Looks like this hasn't been applied, any objection?
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

