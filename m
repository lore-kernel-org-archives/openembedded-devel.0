Received: from [209.85.200.174] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <taroth@gmail.com>) id 1LcRVg-00057W-R2
	for openembedded-devel@openembedded.org; Wed, 25 Feb 2009 22:41:45 +0100
Received: by wf-out-1314.google.com with SMTP id 25so219010wfc.6
	for <openembedded-devel@openembedded.org>;
	Wed, 25 Feb 2009 13:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=TTfje/9JtLwfC81b71G0iTD1zEEDC1yl3fjWdty9spg=;
	b=kmTQZTG8m6X11UUD+b/jauRjVvuIDJt6Cf+hQ5E5ucJB7CtbqPxfMhqTiNYAjUN7i0
	zEWEt0uwAymNUmjxjL/OtfxDwDRvoi1UsZgslus5+DDFhYzvUeR1Uo7pGOZu6IP07uR8
	kTEZdasgU4/YcLHbn6lFPBUSjqpE2ZGh93wTU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=NOMKj+gNZxOZuiVNaaqMDa2hd2K+ZFC7ZW1yxSCsIeTXpiNtRyWVfN0hVyBENTGbya
	Y22OXyNwECNOduAw4THj+YxPUwsfJWZbEboKsxdJ9BbpnRfcYQ4T6Tg3QnLkHEfB3cyM
	WK60SnfcwQrc2QbW/mb7YnNh3umpnghlwOiVY=
MIME-Version: 1.0
Received: by 10.142.70.11 with SMTP id s11mr249251wfa.42.1235597911177; Wed, 
	25 Feb 2009 13:38:31 -0800 (PST)
Date: Wed, 25 Feb 2009 13:38:31 -0800
Message-ID: <f46da1cf0902251338k5592fd9dt91ceb4cdd63dd5b7@mail.gmail.com>
From: "Theodore A. Roth" <taroth@gmail.com>
To: openembedded-devel@openembedded.org
Subject: question for docs
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
X-List-Received-Date: Wed, 25 Feb 2009 21:41:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

I'm working on a user manual update for the "Building Software"
section of chapter 2.

Can someone give me a quick one liner description of the contents of
packages/meta/ and packages/tasks/ which I can use in the user manual?

Thanks.

Ted Roth


