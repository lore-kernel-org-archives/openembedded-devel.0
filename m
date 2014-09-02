Return-Path: <olof.johansson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id B73E56AC7B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Sep 2014 08:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id D6A4C180BF
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Sep 2014 10:52:53 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id lgtRbGIa05s5
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Sep 2014 10:52:49 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 4A6FA18074
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Sep 2014 10:52:49 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 2C17E1034
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Sep 2014 10:52:49 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 20150A60
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Sep 2014 10:52:49 +0200 (CEST)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by thoth.se.axis.com (Postfix) with ESMTP id 1DBB134005
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Sep 2014 10:52:49 +0200 (CEST)
Received: from lnxolofjn.se.axis.com (10.92.17.1) by xmail2.se.axis.com
	(10.0.5.74) with Microsoft SMTP Server id 8.3.342.0;
	Tue, 2 Sep 2014 10:52:48 +0200
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)	id EBD5F9C552; 
	Tue,  2 Sep 2014 10:52:48 +0200 (CEST)
Date: Tue, 2 Sep 2014 10:52:48 +0200
From: Olof Johansson <olof.johansson@axis.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Message-ID: <20140902085248.GD21392@axis.com>
References: <cover.1409584344.git.liezhi.yang@windriver.com>
	<2016151778c10b65ff66b9b885b647bed934d640.1409584344.git.liezhi.yang@windriver.com>
	<20140902083121.GC21392@axis.com> <540583B3.7000105@windriver.com>
MIME-Version: 1.0
In-Reply-To: <540583B3.7000105@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 09/13] apache2: add perl to RDEPENDS_apache2
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
X-List-Received-Date: Tue, 02 Sep 2014 08:52:57 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 14-09-02 10:45 +0200, Robert Yang wrote:
> Yes, these are the only two AFAIK, I will create a apache2-scripts
> which only includes /usr/bin/dbmmanage, and put apxs to -dev.

Awesome, thanks! :)

-- 
olofjn

