Received: from [195.238.6.172] (helo=mailrelay006.isp.belgacom.be)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jpa@mgb-tech.com>) id 1LDZvU-0008H6-IA
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Dec 2008 08:37:36 +0100
X-Belgacom-Dynamic: yes
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ArEEAHDbSklR8zdJ/2dsb2JhbACBbLwoWJBbgwM
Received: from 73.55-243-81.adsl-dyn.isp.belgacom.be (HELO
	hermes.mgb-tech.com) ([81.243.55.73])
	by relay.skynet.be with ESMTP; 19 Dec 2008 08:32:55 +0100
Received: from [192.168.1.23] (gandalf.mgb-tech.com [192.168.1.23])
	by hermes.mgb-tech.com (Postfix) with ESMTP id 85363117FE1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Dec 2008 19:09:50 +0100 (CET)
Message-ID: <494B4E6B.6010607@mgb-tech.com>
Date: Fri, 19 Dec 2008 08:34:03 +0100
From: Jan Pannecoeck <jpa@mgb-tech.com>
User-Agent: Thunderbird 2.0.0.18 (Windows/20081105)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: ARM - OE Linux, Java and SerialPort
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
X-List-Received-Date: Fri, 19 Dec 2008 07:37:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello everyone,

I'm not sure if this is the right mailinglist, but I'll post my question 
here so maybe someone could help me. I'm currently using an OE linux 
distribution on my ARM board, this is all working fine and I'm using 
jamvm to run my java programs. Now I would like to communicate with a 
SerialPort. But the Java Communication API provided by Sun does not 
support an ARM based system. Only the Linux x86 system is supported. 
Since Linux is using the serial port as a "file", the reading and 
writing part could probably be done using a simple Reader and Writer in 
Java, but how can I change the baudrate and other configuration settings 
of the serial port?

Does anybody has any experience with this?

Kind regards, and a early happy christmas!

Jan Pannecoeck


