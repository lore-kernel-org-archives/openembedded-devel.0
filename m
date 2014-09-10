Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 4118D6A941
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Sep 2014 19:07:00 +0000 (UTC)
Received: by mail-qg0-f50.google.com with SMTP id z60so4321166qgd.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Sep 2014 12:07:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/2GCNK66OmO19nY91UXQ1CjuJMJWFkjnxVkce33XXg8=;
	b=Xhvb4J9USsXUieeDb2ejWLHeMLHUdYYW0uUfMr8/WzE6cI7S91gqrH6f/fFFlu9jqC
	gsx/wBJCO5RLHZBCtS7WzmTba5s7c6UQsQzR3ErYg0C7vrb072Are35IrZ9FokQM4+Fd
	AOn7CkfIOAKzmdjsj0AL2SXSV+CNeC0D3q5UUPAPEvhZ62vi6kFEf9j9aPD7QKnBpBQJ
	4KA9E25T0g82JCU5XJfxKY4qNHn0Xm2Jsr2GWmMnTzRRpyRpbI6xgsDbWncjdtqkmCtL
	Uuo5RzDs6hjeRj2GBXJdwmIPYOgaF4akvfrFL4Yb2BwCQWz7RkcsVBFg6dSg4QwmrMgE
	m6kA==
X-Gm-Message-State: ALoCoQnB3ZV1gYw+pCXI0DTMeIMfr5088VXY9waFefuGR1kpYWZQX4bhYqci8g2UGqKFLsrAHrgR
X-Received: by 10.140.105.244 with SMTP id c107mr599363qgf.15.1410376021139;
	Wed, 10 Sep 2014 12:07:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Wed, 10 Sep 2014 12:06:41 -0700 (PDT)
In-Reply-To: <1410374261-10233-1-git-send-email-trevor.woerner@linaro.org>
References: <1410374261-10233-1-git-send-email-trevor.woerner@linaro.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 10 Sep 2014 20:06:41 +0100
Message-ID: <CAJTo0Lbm=FXWGK8BREL0hDuX1xs3_NTfaqoGNoS=2xu0H0MMdw@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
Cc: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-browser][PATCH] nspr: rename .bbappend to match new version from oe-core
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
X-List-Received-Date: Wed, 10 Sep 2014 19:07:10 -0000
Content-Type: text/plain; charset=UTF-8

On 10 September 2014 19:37, Trevor Woerner <trevor.woerner@linaro.org> wrote:
>  rename recipes-support/nspr/{nspr_4.10.3.bbappend => nspr_4.10.7.bbappend} (100%)

Maybe use a wildcard bbappend?

Ross

