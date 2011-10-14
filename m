Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1REVS3-0007pA-N6
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Oct 2011 02:16:39 +0200
Received: by ggnq1 with SMTP id q1so611924ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2011 17:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=JUCDozsE838fWOJYuPI0ulaVWGIxnABZkGTemW7DMxY=;
	b=SJ9Sim4u7L3l52Dr/VfL4FJFwEitEDVvHxoojhxmua69GN7sPrwHIRgCXIKzmzrZ6v
	4fKpTOV+Yx3gfRbhQ0XIEtUhCIiJ2+mP4iXOe8cffl/zZj3X0yqLUrt2by3+nvBXkXMQ
	yji4OjJzPzs/ja92HHKghPvfSHGChfHnAC8Q0=
Received: by 10.68.55.69 with SMTP id q5mr12594716pbp.81.1318551054055; Thu,
	13 Oct 2011 17:10:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.230 with HTTP; Thu, 13 Oct 2011 17:10:24 -0700 (PDT)
In-Reply-To: <1318535732-16028-1-git-send-email-denis@denix.org>
References: <1318535732-16028-1-git-send-email-denis@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Oct 2011 17:10:24 -0700
Message-ID: <CAMKF1sqaW3169pRDurhA+G+fD86Et0BFvf_j4zZBt2_1oOwUKQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] ltp-ddt: import initial version 0.0.4 plus fixes
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
X-List-Received-Date: Fri, 14 Oct 2011 00:16:39 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 13, 2011 at 12:55 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> +
> +TARGET_CC_ARCH += "${LDFLAGS}"
> +

why is this needed ?


