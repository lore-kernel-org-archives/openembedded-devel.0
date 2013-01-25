Received: from smtp4.nedap.com ([213.160.213.85] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1TyhYS-0000ch-7d
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jan 2013 12:34:48 +0100
Received: from nvs0066.nedap.local (10.91.8.1) by relaysmtp1.nedap.local
	(10.1.8.139) with Microsoft SMTP Server id 8.3.83.0; Fri, 25 Jan 2013
	12:19:09 +0100
X-TM-IMSS-Message-ID: <20b93b9800022af6@nedap.com>
Received: from [10.17.16.7] ([10.17.16.7]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id 20b93b9800022af6 ;
	Fri, 25 Jan 2013 12:19:01 +0100
Message-ID: <51026A2D.1030705@nedap.com>
Date: Fri, 25 Jan 2013 12:19:09 +0100
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:16.0) Gecko/20121011 Thunderbird/16.0.1
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: best practice for different projects on the same board
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
X-List-Received-Date: Fri, 25 Jan 2013 11:34:49 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi All,
I'm wondering what the best practice would be in the following situation.
We have a board that is going to be used in several projects.
The set of basic packages is the same but every project might have some 
minor and perhaps sometimes major differences in f.i. config files.
I don't want to make a copy of the base project for every upcoming new 
project. I would really like to handle with the differences only.
What is the best approach for this?
Thanks!
Jaap



