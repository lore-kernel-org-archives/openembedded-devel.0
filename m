Received: from mail-ia0-f169.google.com ([209.85.210.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UAxAY-0001gc-Cu
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Feb 2013 07:41:02 +0100
Received: by mail-ia0-f169.google.com with SMTP id j5so1245227iaf.14
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Feb 2013 22:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=DY3jq9PiDEYbR1dzAy9+YtVQTBz7a30OXYnQurF1Rws=;
	b=j21i0LQ+7v4DWzr9EApZIX9VN8GKCRtoLU3GylLg3/KmMG/7S/ZxrRyc2Xl232C8Zw
	jN82r+WvBdTP981C6JBxaSlsa0WyazmwVw3p7MerB3kYTBKCJPaf3Wd2TaxnzGzP+2Oy
	ZqKDA7c/IRQy1secLfn5CM1dm0jHH+kSJ5waCk/Cg4GArqgvtpHwMC8Ve3XtzBv5LYtr
	xqIUn1lxZcnJO4JbqDfdpePtfH4V0r9lcMHVlZ9sFNCUvNqQ1F/1GFHKB/PknVcxRsXD
	SyqqNJSwJdHYquqzpBIOQWOrNE96uW0sJBi29Kcvkvu+HVabEmM4K5AnupIz1bhCowuc
	gB1w==
X-Received: by 10.50.155.134 with SMTP id vw6mr9210455igb.34.1362032660229;
	Wed, 27 Feb 2013 22:24:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.74.163 with HTTP; Wed, 27 Feb 2013 22:23:49 -0800 (PST)
In-Reply-To: <1362025894-15350-1-git-send-email-sen.zhang@windriver.com>
References: <1362025894-15350-1-git-send-email-sen.zhang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Feb 2013 22:23:49 -0800
Message-ID: <CAMKF1spjo1JxeZd1yJGi4uq2cTp84R3eFrGWZCgPYM12VqQRWw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: joe.macdonald@windriver.com
Subject: Re: [meta-networking][PATCH] pptp-linux: Add dependency to fix parallel build
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
X-List-Received-Date: Thu, 28 Feb 2013 06:41:06 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 27, 2013 at 8:31 PM, Jesse Zhang <sen.zhang@windriver.com> wrote:
> CQID: WIND00405538

what is this ?


