Received: from [203.199.93.25] (helo=omta2.indiatimes.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <pavan_savoy@indiatimes.com>) id 1JqN8O-00021X-I8
	for openembedded-devel@openembedded.org; Mon, 28 Apr 2008 08:46:44 +0200
Received: (qmail 14423 invoked by uid 509); 28 Apr 2008 06:24:09 -0000
Comment: DomainKeys? See http://antispam.yahoo.com/domainkeys
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=private; d=indiatimes.com;
	b=Ua1ZUABw9oGfs2+HmsV/YA+9BY+sKCaVcYMGNRSBujlt4mNWYWuajNtg6FGC9xKS  ;
Received: from 192.168.58.231 by omta2.indiatimes.com (envelope-from
	<pavan_savoy@indiatimes.com>, uid 502) with qmail-scanner-1.25st 
	(clamdscan: 0.91.2/4015. spamassassin: 3.2.3. perlscan: 1.25st.  
	Clear:RC:1(192.168.58.231):SA:0(0.0/4.9):. 
	Processed in 0.09675 secs); 28 Apr 2008 06:24:09 -0000
X-Spam-Status: No, hits=0.0 required=4.9
X-Indiatimes-Scanner-Mail-From: pavan_savoy@indiatimes.com via
	omta2.indiatimes.com
X-Indiatimes-Scanner: 1.25st (Clear:RC:1(192.168.58.231):SA:0(0.0/4.9):.
	Processed in 0.09675 secs Process 14414)
Received: from unknown (HELO mb7.indiatimes.com) (192.168.58.231)
	by omta2.indiatimes.com with SMTP; 28 Apr 2008 06:24:09 -0000
Date: Mon, 28 Apr 2008 12:05:02 +0530 (IST)
From: pavan_savoy@indiatimes.com
To: openembedded-devel@lists.openembedded.org
Message-ID: <2093257597.87241209364502228.JavaMail.root@mbv7.indiatimes.com>
MIME-Version: 1.0
X-Originating-IP: [127.0.0.1]
Subject: Problems adding Input device.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Mon, 28 Apr 2008 06:46:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



Hi,


I have the open-embedded jffs2 image provided in linux4sam for the atmel sam9261ek evaluation board, and the ads7846 touchscreen controller works well on that.

What should I do, if I want to add another touchscreen controller to it, or an usb mouse, or any other input device, how can I make X pick up events from a particular device such as /dev/input/touchscreen0

Thanks

_______________________________________________
Openembedded-users mailing list
Openembedded-users@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-users




