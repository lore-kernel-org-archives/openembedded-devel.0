Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f48.google.com (mail-oa0-f48.google.com
	[209.85.219.48])
	by mail.openembedded.org (Postfix) with ESMTP id 5382F704F7
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 18:27:56 +0000 (UTC)
Received: by mail-oa0-f48.google.com with SMTP id m1so6329229oag.35
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 11:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=CqXlPdGqtuPEGEoZnz4/7cMYzCwh+GkpdPmgEAGtQyg=;
	b=BVOcv8mwaciDlmAZTunElYnztX4P+AfIEDIqziRZVftgM25h10LaR6Ab35Bb77n8+5
	USvbvMjQsRavBw+XYREPEuAy/cSNrp+o9Emh703ADhflfRy4Q63GJoL0Sq1Rjo3MEqoC
	ssjb555GolckD0e6Qxdt3+E4jmIYldbwYCBaVmfvqSJMG1KNIByxxnaKVP9ZlR93Ojb/
	ARefzS5xTN6PHQVZbERt4n/89j2gVY7q3U+PvyF7u6bGC3zvbUTWuZNzQqF4vAPi2HXW
	84u5F3fULg1YuGfDHZQMlXk8KPbwW+YAn2IcC5Fo+vhdsZnkKhUZu7wZZADr8hBuzwgT
	qdgQ==
MIME-Version: 1.0
X-Received: by 10.60.179.114 with SMTP id df18mr5190241oec.76.1405448878129;
	Tue, 15 Jul 2014 11:27:58 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.50.135 with HTTP; Tue, 15 Jul 2014 11:27:58 -0700 (PDT)
In-Reply-To: <1403889196-11872-1-git-send-email-lauren.post@freescale.com>
References: <lauren.post@freescale.com>
	<1403889196-11872-1-git-send-email-lauren.post@freescale.com>
Date: Tue, 15 Jul 2014 15:27:58 -0300
X-Google-Sender-Auth: mLXBkcdaSRsn4E8tjd83B71bKLs
Message-ID: <CAP9ODKqccAwSGjkv15wmvFgcLsL3+MCWte+KvA4-6TDf_U9uxw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Lauren Post <lauren.post@freescale.com>,
	Martin Jansa <martin.jansa@gmail.com>
Cc: OpenEmbedded Devel List <Openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v3] cpuburn-neon: Upgrade to version 20140626
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
X-List-Received-Date: Tue, 15 Jul 2014 18:27:57 -0000
Content-Type: text/plain; charset=UTF-8

Martin,

On Fri, Jun 27, 2014 at 2:13 PM, Lauren Post <lauren.post@freescale.com> wrote:
> Previous location is no longer accessible and breaks builds that include
> cpuburn-neon.  This updates the location to fix the build breaks
>
> Signed-off-by: Lauren Post <lauren.post@freescale.com>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Ping?

This is an important fix as it breaks builders.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

