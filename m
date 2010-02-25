Received: from hsp-52.hspserver.com ([85.197.80.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ml@vdm-design.de>) id 1NkjeQ-0001Js-0N
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Feb 2010 20:45:34 +0100
Received: from localhost (localhost [127.0.0.1])
	by hsp-52.hspserver.com (Postfix) with ESMTP id 23883A2C3B1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2010 20:42:50 +0100 (CET)
Received: from hsp-52.hspserver.com ([127.0.0.1])
	by localhost (hsp-52.hspserver.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id OQWdng7iIr2n
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2010 20:42:49 +0100 (CET)
Received: from tomboy.localnet (pD9E17B74.dip.t-dialin.net [217.225.123.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by hsp-52.hspserver.com (Postfix) with ESMTP id BD70FA2C3A8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2010 20:42:49 +0100 (CET)
From: Thomas Zimmermann <ml@vdm-design.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Feb 2010 20:42:46 +0100
User-Agent: KMail/1.12.4 (Linux/2.6.32-9.slh.1-sidux-amd64; KDE/4.3.4; x86_64; ;
	)
References: <1267126481-27969-1-git-send-email-ml@vdm-design.de>
In-Reply-To: <1267126481-27969-1-git-send-email-ml@vdm-design.de>
MIME-Version: 1.0
Message-Id: <201002252042.46906.ml@vdm-design.de>
X-SA-Exim-Connect-IP: 85.197.80.179
X-SA-Exim-Mail-From: ml@vdm-design.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] [RFC] ca-certificates: add package for ssl certificates
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
X-List-Received-Date: Thu, 25 Feb 2010 19:45:34 -0000
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit

Please comment about that recipe.

Should we add such a recipe?
Is debian a good source?
Is it ok to generate the cert file on the device, or should we just ship a 
prebuild certificate? But then the problem would that, that the user can't 
remove installed certs easiely.

In the generated /etc/ca-certificates.conf is a comment missing about how to 
remove recipes, that should be added.

Thomas


