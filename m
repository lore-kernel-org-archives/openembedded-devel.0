Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 633E76E7FE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2014 09:04:16 +0000 (UTC)
Received: by mail-qc0-f176.google.com with SMTP id e16so101039qcx.21
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2014 01:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=VZE9i4ahF8DIi/U0tpiE0RdGyEVus8pTMF1qPAGjiaU=;
	b=JEiTZMo9DThm5pKWMnWlCahjNBCMQDhBK0qvx9Vwe7eD4C0HmQojERTIODhJCJoRUo
	of8dFHLyi1G8VHaBz11ga2akJDLoOciNSXKi/BPMAANggC+lnwY5pXpVv1oXrjfpyVXD
	GPb2gLY4Qx/obQAeFEMo2wEj30wTKBaiZ2tLYfCk11HH8+QSNbXVkfSN4grs4jjwtopM
	E6szPXf5f68uKp+QHYaD4I+HQ8Rxbe7I+JYBYhRi0KtYupANSg3esgZP7C5r8DZIUuIi
	VVKFyDt3lcxcxEunGvEquaKqGh1A7xMhYHJ6HcMIZHeHyndRtSPeIPJtjrRuX0oRfFaa
	2uPw==
X-Received: by 10.224.114.141 with SMTP id e13mr571858qaq.65.1392800657314;
	Wed, 19 Feb 2014 01:04:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.25.47 with HTTP; Wed, 19 Feb 2014 01:03:57 -0800 (PST)
In-Reply-To: <1392798218-17950-1-git-send-email-koen.kooi@linaro.org>
References: <1392798218-17950-1-git-send-email-koen.kooi@linaro.org>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Wed, 19 Feb 2014 06:03:57 -0300
Message-ID: <CAMCfZKEbvjyBJ-WJSmB1OfO6rGZT3ya87upAqeO4KfY71NMJHw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: Re: [meta-oe][PATCH] mariadb: move linker fix to .inc
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
X-List-Received-Date: Wed, 19 Feb 2014 09:04:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 19, 2014 at 5:23 AM, Koen Kooi <koen.kooi@linaro.org> wrote:

> +           file://fix-link-error-ub1310.patch \
>

Should not the patch name and description to be modified since it is no
longer associated with Ubuntu 13.10?

Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br

/*long live rock 'n roll*/

