Received: from smtp3.nedap.com ([87.249.123.12] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1QmNOT-0003mq-0l
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jul 2011 12:00:41 +0200
Received: from nvs0066 ([10.91.8.1]) by smtp.nedap.com with Microsoft
	SMTPSVC(6.0.3790.1830); Thu, 28 Jul 2011 11:56:25 +0200
X-TM-IMSS-Message-ID: <4d1ae9dd00021f69@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id 4d1ae9dd00021f69 ;
	Thu, 28 Jul 2011 11:55:33 +0200
Message-ID: <4E31324C.3030901@nedap.com>
Date: Thu, 28 Jul 2011 11:56:28 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 28 Jul 2011 09:56:25.0691 (UTC)
	FILETIME=[9D0FDAB0:01CC4D0C]
Subject: how to apply bbappend selectively
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
X-List-Received-Date: Thu, 28 Jul 2011 10:00:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi All,

I.m creating a special image with for instance a modified udev package.
I've created a udev-xxx.bbappend for that purpose.
But for all the other images I build for other hardware I still want to 
use the original udev-xxx.
There is probably a simple solution but I don't see it...
Any ideas?

Thanks in advance!
Jaap


