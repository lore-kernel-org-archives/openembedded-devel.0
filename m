Received: from [64.28.152.243] (helo=smtp-relay2.palm.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rich.pixley@palm.com>) id 1KH6QI-0004AV-5S
	for openembedded-devel@openembedded.org; Fri, 11 Jul 2008 02:23:42 +0200
X-IronPort-AV: E=Sophos;i="4.30,341,1212390000"; d="scan'208";a="10985674"
Received: from unknown (HELO mailhost01.palm.com) ([148.92.223.30])
	by smtp-relay2.palm.com with ESMTP; 10 Jul 2008 17:23:24 -0700
Received: from flamingo.palm1.palmone.com (flamingo.palm1.palmone.com
	[148.92.248.64])
	by mailhost01.palm.com (8.13.6+Sun/8.12.10) with ESMTP id
	m6B0Mr1t018708; Thu, 10 Jul 2008 17:23:13 -0700 (PDT)
Message-ID: <4876A7DD.8090608@palm.com>
Date: Thu, 10 Jul 2008 17:22:53 -0700
From: Rich Pixley <rich.pixley@palm.com>
User-Agent: Thunderbird 2.0.0.14 (Macintosh/20080421)
MIME-Version: 1.0
To: "openembedded-devel@openembedded.org" <openembedded-devel@openembedded.org>
References: <48761569.4080304@gmx.net> <1215703284.32070.6.camel@isis>
In-Reply-To: <1215703284.32070.6.camel@isis>
Subject: bitbake man page typo
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Fri, 11 Jul 2008 00:23:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Index: bitbake.1
===================================================================
--- bitbake.1    (revision 48512)
+++ bitbake.1    (working copy)
@@ -64,7 +64,7 @@
 Specify task to execute. Note that this only executes the specified 
task for
 the providee and the packages it depends on, i.e. 'compile' does not 
implicitly
 call stage for the dependencies (IOW: use only if you know what you are 
doing).
-Depending on the base.bbclass a listtaks tasks is defined and will show
+Depending on the base.bbclass a listtasks tasks is defined and will show
 available tasks.
 .TP
 .B \-rFILE, \-\-read=FILE


