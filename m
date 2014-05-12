Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f176.google.com (unknown [209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1CB3D61F16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 May 2014 16:29:57 +0000 (UTC)
Received: by mail-ie0-f176.google.com with SMTP id ar20so3837838iec.35
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 May 2014 09:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=/YLr+kOtwwt6X+P4pBOjn854nVJUfiqY3V1g81lmjEw=;
	b=k/8JOMeO8rjJ4+++LnIsyeNnAIQ5h9sjc97899vSuC64yCxIC5KCazLwFUbmyxPJ6+
	xqNE0JkNngxSp4+zvMTOxc46Y3zuRM8bH5gmzEv35ZJQ6kkIPKKdaCt7qpCfwwX9B6/O
	OG42ACexYotBbV9pB+MXKSyK5eVCPZMFjv7PtZrz05jz8eLySuRT319owlmJzfJLh6Qg
	KQznqWbNBVyme6TrWTbVJKQATuAbsWcKvKjXPHcbEh7qod08q4+nScZsmba153Wy8N5K
	bkKJkENPHhxbtBx1agJJshhguQJRoA7L2KXQOJPbtG6tmbWo5K7sSknU2NS7VBXG7ZQy
	uvEA==
X-Received: by 10.50.43.136 with SMTP id w8mr45116591igl.20.1399912198443;
	Mon, 12 May 2014 09:29:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.79.133 with HTTP; Mon, 12 May 2014 09:29:28 -0700 (PDT)
In-Reply-To: <1399908925-9351-1-git-send-email-alexandre.fournier@kiplink.fr>
References: <1399908925-9351-1-git-send-email-alexandre.fournier@kiplink.fr>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 12 May 2014 09:29:28 -0700
Message-ID: <CAMKF1soW7Do399pYg+TwNDDOn5PLHOpxrdpo0gx4Nc3yW-MW9g@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] net-snmp: install net-snmp-config script to STAGING_BINDIR_CROSS
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
X-List-Received-Date: Mon, 12 May 2014 16:30:02 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 12, 2014 at 8:35 AM, Alexandre Fournier
<alexandre.fournier@kiplink.fr> wrote:
> -PR = "r1"
> +PR = "r2"

not needed.

