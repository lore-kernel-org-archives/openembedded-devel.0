Received: from smtp2.nedap.com ([213.160.213.92] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1QouaC-00031j-PW
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Aug 2011 11:51:17 +0200
Received: from nvs0066 ([10.91.8.1]) by smtp.nedap.com with Microsoft
	SMTPSVC(6.0.3790.1830); Thu, 4 Aug 2011 11:46:52 +0200
X-TM-IMSS-Message-ID: <711e7e9200030d3a@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id 711e7e9200030d3a ;
	Thu, 4 Aug 2011 11:45:47 +0200
Message-ID: <4E3A6A8D.3010301@nedap.com>
Date: Thu, 04 Aug 2011 11:46:53 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 04 Aug 2011 09:46:53.0025 (UTC)
	FILETIME=[709E3510:01CC528B]
Subject: exclude (r)depends
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
X-List-Received-Date: Thu, 04 Aug 2011 09:51:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi All,
this is probably simple but I don't know how.
I've build a simple recipe.
Bitbake figures it depends on libsqlite0 and libsqlite3-0; which is 
correct by the way...
For some reason I don't want the dependencies in the ipk file.
Is there some flag for this?
Thanks!
Jaap



