Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LMjg5-000526-P4
	for openembedded-devel@openembedded.org; Tue, 13 Jan 2009 14:51:34 +0100
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LMjZm-0004qc-Jk
	for openembedded-devel@openembedded.org; Tue, 13 Jan 2009 13:45:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 13 Jan 2009 13:45:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 13 Jan 2009 13:45:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 13 Jan 2009 14:40:18 +0100
Message-ID: <gki5k2$jm$2@ger.gmane.org>
References: <d6d644b80901130305j687168fapb3fa7659f2696742@mail.gmail.com>	<gkht6i$2b6$1@ger.gmane.org>
	<d6d644b80901130527x62dca925wfff7c91e14a4671f@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20081230 Shredder/3.0b2pre
In-Reply-To: <d6d644b80901130527x62dca925wfff7c91e14a4671f@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: Qt-app won't build since libQtUiTools not included in staging
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
X-List-Received-Date: Tue, 13 Jan 2009 13:51:36 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13-01-09 14:27, Erik Botö wrote:
> Hi again!
>
> When I build qt-embedded I get the "E" suffix on all libraries but
> QtUiTools. If I enter the workdir for qt-embedded and lists the content of
> the lib-dir I have all the .la libraries with the E suffix, like
> "libQtGuiE.la" etc. But the QtUiTools file is called "libQtUiTools.a"
> without the "E". So if qt_staging.inc expects the suffix to be there I guess
> it won't find the file?
>
> Is the QtUiTools some kind of exception, or should it also be suffixed with
> an E?

I would class it as a bug and make the QT people look at it, Holger?

regards,

Koen



