Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ttkrpink@gmail.com>) id 1NxD0J-0000FT-E0
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 07:31:44 +0200
Received: by gwj21 with SMTP id 21so638651gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Mar 2010 22:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:received:message-id
	:subject:from:to:content-type;
	bh=CMbCjDv8YOzaMv/ghB26L0nwCKEvhZERuSMrPs21aUo=;
	b=ZtkYmGuO2I1OCagmY26vKOJt0PXdTxv04I49kXDDR3fhKAVYKcQBM/EjT7KPBX4Izh
	y3Xlt/ArUjntETKgwsH7EMv7RjxY3wdk8mIGY9hZVrtn2Y7ruThBo1LprG6l4G0ZCN1G
	jMKYjt78LrZRnLCN404uSt1VITpbIykepqWbU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=NtiyVCi0dI4Ix7JBoxMqy5u5cnynWygUnEXqTwOnM4yS8+GL8SPtyGOBlAICRfmei4
	YLVo2ikBooPkjRL6wbEvAXiiMYvB/qPjvF97VsQ261EJL2H7R33CzwcIXKa00QEX/CLH
	s/vvO6Avhptq23eFVMSq1HzMvko0jjwCji2XQ=
MIME-Version: 1.0
Received: by 10.100.110.17 with HTTP; Wed, 31 Mar 2010 22:28:25 -0700 (PDT)
Date: Wed, 31 Mar 2010 23:28:25 -0600
Received: by 10.101.51.16 with SMTP id d16mr1525897ank.36.1270099705864; Wed, 
	31 Mar 2010 22:28:25 -0700 (PDT)
Message-ID: <t2yd2a86f8e1003312228g46462ac4iac67f8d051aac7b1@mail.gmail.com>
From: ttk rpink <ttkrpink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: ttkrpink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: how to add wxpython
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
X-List-Received-Date: Thu, 01 Apr 2010 05:31:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

How can I add wxPython to my distribution?
I have:
-----------------
export IMAGE_INSTALL += " \
                hello \
                python \
                python-pygtk"

inherit image

export IMAGE_BASENAME = "mydistro-image"
----------------


Thanks,

ttk

