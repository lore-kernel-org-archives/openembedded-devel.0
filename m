Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1M725V-0001We-L5
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 May 2009 08:49:09 +0200
Received: by ewy20 with SMTP id 20so1070249ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 May 2009 23:41:34 -0700 (PDT)
Received: by 10.210.33.15 with SMTP id g15mr843999ebg.45.1242888094539;
	Wed, 20 May 2009 23:41:34 -0700 (PDT)
Received: from ?192.168.1.10? (94-193-93-235.zone7.bethere.co.uk
	[94.193.93.235])
	by mx.google.com with ESMTPS id 21sm1398601ewy.66.2009.05.20.23.41.33
	(version=SSLv3 cipher=RC4-MD5); Wed, 20 May 2009 23:41:33 -0700 (PDT)
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1242873578-17444-22-git-send-email-otavio@ossystems.com.br>
References: <1242873578-17444-1-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-2-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-3-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-4-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-5-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-6-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-7-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-8-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-9-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-10-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-11-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-12-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-13-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-14-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-15-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-16-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-17-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-18-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-19-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-20-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-21-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-22-git-send-email-otavio@ossystems.com.br>
Date: Thu, 21 May 2009 07:41:24 +0100
Message-Id: <1242888085.3337.0.camel@xora-desktop.xora.org.uk>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 (2.26.1-2.fc11) 
Subject: Re: [PATCH 21/23] gnumeric: update to 1.8.4
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
X-List-Received-Date: Thu, 21 May 2009 06:49:09 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-05-20 at 23:39 -0300, Otavio Salvador wrote:
> We updated it to latest stable release and droped the old versions
> since noone is preferring those. Another small change is to depends on
> gdk-pixbuf-csource-native otherwise the build can fail if the host
> doesn't has the development files of GTK+ installed.
> 
> The only reference to a gnumeric version has been found at
> preferred-om-2008-versions.inc and it referred to a missing
> version. This also makes it to point to the latest one.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Acked-by: Graeme Gregory <dp@xora.org.uk>




