Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qc0-f174.google.com (mail-qc0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 334706EA47
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Feb 2014 09:03:05 +0000 (UTC)
Received: by mail-qc0-f174.google.com with SMTP id x13so8542692qcv.33
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Feb 2014 01:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=Fqw7bYgeniM4jphn2fUq2Ss/L1iYjvlMotfajBLX4aA=;
	b=AlOlaVJyfFHcg1MYX0OYFrhHnR/PKLhwBwcjOEcx6Mg2YWiA2vgxh61nIC/Jurp+FW
	NeU0rUFYjfneLrjE6sN4F8Pw8DJ8EBMS2DT0L6/1viKn8elwbAxHGHZx9S9KPPZNQT6P
	PYiikREQP7ZMy4GVgyBK1J9E30SNTvS3972C/GD6M7qLF+Nq4Xodc/OycjAIBqniWKAu
	V39FPGXjOufqgWJHKLe15+An6/GvVJowAY7nChjyuesQEfJyBGV9md3Urh/ea7lGyMAR
	6Fh5vTaiesqqApcVRC7D5wzKKbBuHKWdc6fdbiy7HGQbSfr63CR/6WnnjRx2LmCqMKz2
	/C2A==
X-Received: by 10.224.151.147 with SMTP id c19mr38790694qaw.86.1391245385637; 
	Sat, 01 Feb 2014 01:03:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.25.47 with HTTP; Sat, 1 Feb 2014 01:02:45 -0800 (PST)
In-Reply-To: <20140201074259.GA3718@jama>
References: <1391198644-9408-1-git-send-email-diego.sueiro@gmail.com>
	<20140201074259.GA3718@jama>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Sat, 1 Feb 2014 07:02:45 -0200
Message-ID: <CAMCfZKE77D8YXHJXwzndCLQ8VgojKTtSv6h=KDxVQtA69FMGvQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [for-dora] systemd: journald fix ignored disk space restrictions
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
X-List-Received-Date: Sat, 01 Feb 2014 09:03:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Feb 1, 2014 at 5:42 AM, Martin Jansa <martin.jansa@gmail.com> wrote:

> Hello Diego, this belongs to openembedded-core ML.
>
Sorry about this.

>
> It's not clear from the bug report, but these patches are included in
> 208 release right?
>
I believe that these patches are included in 207 release.

> Please check and mention it in commit message to
> explain that this isn't needed in oe-core/master.
>
Ok.

Thanks for reviewing it.

Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br

/*long live rock 'n roll*/

