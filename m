Return-Path: <diego.ml@zoho.com>
X-Greylist: delayed 905 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 05 May 2017 15:43:42 UTC
Received: from sender-pp-092.zoho.com (sender-pp-092.zoho.com [135.84.80.237])
	by mail.openembedded.org (Postfix) with ESMTP id 3DB2877DE7
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 May 2017 15:43:42 +0000 (UTC)
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zapps768; d=zoho.com; 
	h=from:to:subject:date:message-id:mime-version:content-type; 
	b=eJ1o4sRmb6EKGq5ZCptsbQySds6jFNa6bB4OVr+bVI8dEN0zD5HqglVfVl6xdNmPuwShDp7BRWwg
	Rg8qJHBRsPzN/BejJTi2qkZBAuZjb4X3//khaVf06/Uh9hOJ4Gz/  
Received: from localhost.localdomain
	(host57-224-static.7-79-b.business.telecomitalia.it
	[79.7.224.57]) by mx.zohomail.com
	with SMTPS id 1493998117081714.2760040214885;
	Fri, 5 May 2017 08:28:37 -0700 (PDT)
From: Diego <diego.ml@zoho.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 05 May 2017 17:28:34 +0200
Message-ID: <3163967.p2ER9ipgk2@localhost.localdomain>
MIME-Version: 1.0
X-ZohoMailClient: External
Subject: [bug] lua doesn't provide shared library
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 May 2017 15:43:44 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi all,

I wanted to report what looks a bug to me: the lua recipe in meta-oe doesn't 
provide the liblua.so shared library.

Bests,
Diego


