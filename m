Return-Path: <gary.robertson@linaro.org>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3B0AD736B6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Apr 2015 21:50:48 +0000 (UTC)
Received: by obbec2 with SMTP id ec2so100338274obb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Apr 2015 14:50:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=sZG9Md/2/xRnUyvk1se0MxEACcwS6WUxiTr2dY4lpYA=;
	b=UfqkgWZXBPYKxilmJk7MWYehrvB0SWvs74qnbHljR8QiRZmFoJVT/dt7MTgYNZRrj2
	I29QW5KSkcL7ikM0DRK2YJQkmjYWmOCumxcr23VzPbrRGWqkSKGen/wtiuZDhPZD16TJ
	2LZyqKcVEEmbqXUAyLWtiiu2Y1olKQXUXrB6Mk7R4BB387BaZJE0Rr3AoIuA4v/wNOje
	ukZgFujX7Y4gB1COsycVrxqK2T4mgx5iYLll9uiwuRUvJtJbXx/FASJT60QWToOL5OfY
	b4WSIC0/5w6XZMVM79qIf6KI/3F0bei0IMeYhqKekDhJLq+3wHKvI5V1x+WMbrBwNKxu
	DimA==
X-Gm-Message-State: ALoCoQmbPKmUT7PDjO2znFh9C86hDbjaVEFpr7Ufy6eiqSDvWHjFka3meetDY8bNUKs8TrCdNLoO
X-Received: by 10.182.186.100 with SMTP id fj4mr43159990obc.12.1427925049054; 
	Wed, 01 Apr 2015 14:50:49 -0700 (PDT)
Received: from honkintosh.cybertech.lan (65-120-133-114.dia.static.qwest.net.
	[65.120.133.114])
	by mx.google.com with ESMTPSA id ud3sm2898046oeb.2.2015.04.01.14.50.47
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 Apr 2015 14:50:48 -0700 (PDT)
From: "Gary S. Robertson" <gary.robertson@linaro.org>
To: Martin Jansa <martin.jansa@gmail.com>, Ross Burton <ross.burton@intel.com>
Date: Wed,  1 Apr 2015 16:50:12 -0500
Message-Id: <1427925013-7492-1-git-send-email-gary.robertson@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <20150331070731.GI14928@jama>
References: <20150331070731.GI14928@jama>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH V3] add CUnit test suite
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
X-List-Received-Date: Wed, 01 Apr 2015 21:50:51 -0000

Thanks very much for your prompt reply, critique, and for the link to the
patch submission guidelines document.  I see by reading that document that
I made some of the canonical irritating mistakes mentioned there.
I appreciate your patience as I slowly learn the fine points of
upstreaming patches properly.

I have attempted to properly incorporate all your cleanup suggestions
and hope this version of the recipe will be satisfactory.

Thanks,

Gary Robertson


