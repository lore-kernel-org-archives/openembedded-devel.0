Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RzZmS-0000Hs-Fa
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Feb 2012 21:24:16 +0100
Received: by lahc1 with SMTP id c1so6838891lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2012 12:15:58 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.152.110.102 as permitted sender) client-ip=10.152.110.102; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.152.110.102 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.152.110.102])
	by 10.152.110.102 with SMTP id hz6mr18240305lab.21.1329768958404
	(num_hops = 1); Mon, 20 Feb 2012 12:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=2jt3904tbX5oOczSKHGCPprM0WCEhRIR2JwpgXji+qE=;
	b=FZkJA29RpLUqhiakXeL1CRrYNlsFmNJa9IwtU8SyvYkc49/pjKsxP/IvJWTO421iWl
	hbAO+yjrRSkcTaxZxHXezikel0N+SyqeOGZiV9/0TlP+DFiyVXc1u4AApq39uRjV8wQg
	Ko6lKUS17TG2HcG6xpB6LeATK/T7heowoDLdQ=
Received: by 10.152.110.102 with SMTP id hz6mr15241659lab.21.1329768958360;
	Mon, 20 Feb 2012 12:15:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.27.109 with HTTP; Mon, 20 Feb 2012 12:15:28 -0800 (PST)
In-Reply-To: <4F429115.3070907@opendreambox.org>
References: <1329745909-21013-1-git-send-email-eric@eukrea.com>
	<4F429115.3070907@opendreambox.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Feb 2012 12:15:28 -0800
Message-ID: <CAMKF1soWPAX9S06t3JJb1LZdFUozr+AQ89=apxbXkZWz_ShcVQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
Subject: Re: [meta-oe] vsftpd: add new package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Feb 2012 20:24:16 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 20, 2012 at 10:29 AM, Andreas Oberritter
<obi@opendreambox.org> wrote:
> +LICENSE = "GPL-2.0-with-OpenSSL-exception"

there might be a different way to represent that


