Received: from [74.125.46.156] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1MB74D-0003Wc-Q1
	for openembedded-devel@openembedded.org; Mon, 01 Jun 2009 14:56:41 +0200
Received: by yw-out-1718.google.com with SMTP id 5so3519941ywm.30
	for <openembedded-devel@openembedded.org>;
	Mon, 01 Jun 2009 05:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=Fw0KkPe847OV8esLh4VQc5YOUFNA++OxroN4HwkwoS4=;
	b=wVE+a+aOwN8JqOIk5GbkrttXshKuxEv5MQ+FNUc31ZB/SJdn/SXqptMjEH4Zw8ITah
	Fb7ArQe+lAJeC4eQqlfXmhYW1ENyFdbtc7a6jcpNjZZNSy1ug6pYQguT9JoLjSN6sdrs
	5UNfml0ANf2l6rGWQ1yzBpxycPr5CrKDGln04=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=PZHZtS5oIMJqs9XStuTdyQDafjivBdAONas7DNQVsVMvUigai8pJOYPJidfyKCzGAn
	BsGfopzhhdNVr0QpxfyXzD6XT1MMc33zIFtg2ZflH+iuHkpa7lOe1SHsImMK8kxI9Hyv
	S+emJnWb/soiSUyF5nqIL6VR/CO55CP6DqRPY=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.91.19 with SMTP id o19mr7245786anb.48.1243860477482; Mon, 
	01 Jun 2009 05:47:57 -0700 (PDT)
In-Reply-To: <gvuk6k$hfc$1@ger.gmane.org>
References: <1243774077-19022-1-git-send-email-k.kooi@student.utwente.nl>
	<gvu149$nlk$1@ger.gmane.org>
	<be7a9f3d0905311100j91409d3n8011a9cffdba6fbc@mail.gmail.com>
	<gvuhfg$bf$1@ger.gmane.org>
	<be7a9f3d0905311134u767facd2j44807b0756f9d78f@mail.gmail.com>
	<gvuk6k$hfc$1@ger.gmane.org>
Date: Mon, 1 Jun 2009 09:47:57 -0300
X-Google-Sender-Auth: eda932375261cbe7
Message-ID: <be7a9f3d0906010547k2dc8fb26ob881e8282aadaff8@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: [STABLE][PATCH] xserver-common: add 1.24 from .dev
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
X-List-Received-Date: Mon, 01 Jun 2009 12:56:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Koen,

On Sun, May 31, 2009 at 4:01 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> On 31-05-09 20:34, Otavio Salvador wrote:
>> I think it needs to be fixed in dev and then this ought to be done in
>> stable all together to avoid issues for current users. I'm one that
>> will have problems with this change.
>
> Fair enough, want to cook up a patch for that?

I can take a look at it but I doubt I'll be able to send it before Wed
since I have busy days before it, at work. If you can, please take a
look at it otherwise I do.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


