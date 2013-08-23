Return-Path: <b.hutchman@gmail.com>
Received: from mail-oa0-f42.google.com (mail-oa0-f42.google.com
	[209.85.219.42])
	by mail.openembedded.org (Postfix) with ESMTP id AF2BB60609
	for <Openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2013 21:39:14 +0000 (UTC)
Received: by mail-oa0-f42.google.com with SMTP id i18so1411793oag.29
	for <Openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2013 14:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=oaHepimArKM6otE2quM1N/QakSKj4/Pi7XQJLJnpyWM=;
	b=HEZbkg2WlRos7jUoScpww0zvWn+y2wILg6xYkw5hQ+QZOW5UFuCTC3B21gC0X8SBYq
	U3nZzcmcYG7Wch3Hhs4c0U6jXx6XV3A143bnyyQ9botSLqrPU0u9Nl0XA8UjY+4beN+C
	JQkoSBew892Ql+dbvVwb/BmqoqVGmCNxbjIvTOqALnrvvnPC4QxQWL4ap6Y8tx671Fko
	cIwT1dLssEtuCF4poWUZvUrt0+1yL+wpAJQEuBkNDf28aSdCn1Xsbv8xls5mLXvT0AZy
	Gb0sx6WkBFBmTrdM9dj/hmKTyasONkUbGmj3xqGzy8gqcw79thXgTvHAN2foFn6AkpNC
	24hw==
MIME-Version: 1.0
X-Received: by 10.182.227.227 with SMTP id sd3mr1470422obc.68.1377293954990;
	Fri, 23 Aug 2013 14:39:14 -0700 (PDT)
Received: by 10.60.142.41 with HTTP; Fri, 23 Aug 2013 14:39:14 -0700 (PDT)
Date: Fri, 23 Aug 2013 17:39:14 -0400
Message-ID: <CAFZh4h-usjdRAc2paooPsVruToQnR_LtHsYKZEPh2nqke8K=yw@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: Openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-oe] recipe for recipes-support/gd/gd_2.0.35+2.0.36rc1.bb is busted
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
X-List-Received-Date: Fri, 23 Aug 2013 21:39:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hey Koen,

Looks like the packaged got bumped up to 2.1.0 now.

Looks like the SRC_URI changed to
https://bitbucket.org/libgd/gd-libgd/downloads/libgd-2.1.0.tar.gz or
http://fossies.org/linux/www/libgd-2.1.0.tar.gz/

I tried to fix it but I can't get the do_configure to work.

Regards,

Brian

