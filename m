Received: from mail-iw0-f180.google.com ([209.85.223.180])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vandana.vuthoo@gmail.com>) id 1NmgdD-0003aE-Gw
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Mar 2010 05:56:24 +0100
Received: by iwn10 with SMTP id 10so985411iwn.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Mar 2010 20:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=mGeh7QzubBlnMY9m5nA56L1HR5bTaeERZDfDNkMH8zg=;
	b=xSD8OrPf4UReZIEPQ3Alwso0/RwFwI6y8J/ur0u88cG/1jYy1U7BCdCdDWcBFv29cq
	ITyRpXEgEGILwMWFDc/8J2KxvdPp+v2MyTJAZ743JibZCZhZqcXuZ/nHU7SCQvxltdCn
	h0Q3HoOMcGT1FGjKl/XweGzxUzh2Lc5AY0FnY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=ChvXHVTNNapvgVTkUAmyX9tiPCQ7OkoLQsN9DXJgCN64sHwpww7zGdbly/9I18weAk
	1EH8h5+qXFvWz5wUs1CnMnvgq7Qt3egPwe/kPtLPJblKrf/Z4NZ2bQTB1p/9BvEMFJEY
	EK0/nZehddX3xVgtpA8lkCkNN6AZhXw4pRFdE=
MIME-Version: 1.0
Received: by 10.231.159.207 with SMTP id k15mr544491ibx.75.1267592010924; Tue, 
	02 Mar 2010 20:53:30 -0800 (PST)
Date: Wed, 3 Mar 2010 10:23:30 +0530
Message-ID: <2b288bf1003022053g2dbca134s20b172e94911060e@mail.gmail.com>
From: Vandana Vuthoo <vandana.vuthoo@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.180
X-SA-Exim-Mail-From: vandana.vuthoo@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: locale support in OE
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
X-List-Received-Date: Wed, 03 Mar 2010 04:56:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,
I need to know how to add diff locale supports in OE, I tried
IMAGE_LINGAUS but it is not working for me.
Regards,
Vandana


