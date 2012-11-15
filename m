Received: from smtp4.nedap.com ([213.160.213.85] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1TZ0Iu-0008Kx-La
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Nov 2012 15:20:28 +0100
Received: from nvs0066.nedap.local (10.91.8.1) by relaysmtp1.nedap.local
	(10.1.8.139) with Microsoft SMTP Server id 8.3.83.0; Thu, 15 Nov 2012
	15:06:31 +0100
X-TM-IMSS-Message-ID: <ed614887002047be@nedap.com>
Received: from [10.17.24.8] ([10.17.24.8]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id ed614887002047be ;
	Thu, 15 Nov 2012 15:06:23 +0100
Message-ID: <50A4F6E6.9040507@nedap.com>
Date: Thu, 15 Nov 2012 15:06:30 +0100
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:16.0) Gecko/20121011 Thunderbird/16.0.1
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: llvm issue
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
X-List-Received-Date: Thu, 15 Nov 2012 14:20:28 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi All,

when I checkout openjdk-7 on meta-java and bitbake <anything> I get 
these errors:

ERROR: Unable to parse 
/data/jenkins/jobs/myTest/workspace/sources/meta-java/recipes-core/llvm/llvm2.9_2.9.bb 
| ETA:  00:00:15
ERROR: Command execution failed: Exited with 1
NOTE: Error expanding variable populate_packages
NOTE: Error during finalise of 
/data/jenkins/jobs/myTest/workspace/sources/meta-java/recipes-core/llvm/llvm2.8_2.8.bb
NOTE: Error expanding variable populate_packages
NOTE: Error during finalise of 
/data/jenkins/jobs/myTest/workspace/sources/meta-java/recipes-core/llvm/llvm2.9_2.9.bb

Anyone already know what is wrong here?

Cheers!
Jaap

